# Managing Environment Variables

I like to think of **env vars** as a way you can plug an application into
other services. When you deploy an application to a server, you need a way to
inform the application of the database server, mail server, and other
supporting services it has available.

This article will deal primarily with how we can make the mangement of this
configuration of your application a bit easier.

## Document

Document the environment variables in a file in the root folder of the
application. We will want to check this file into version control so
that other developers on the project have a template to copy from.

```bash
# .env.example

DATABASE_URL="postgres://username:password@hostname/database_name"
SMTP_ADDRESS="smtp.gmail.com"
SMTP_USERNAME="username"
SMTP_PASSWORD="password"
```

Make a copy of the example file. Replace the placeholder values in the new
`.env` file.

```bash
$ cp .env.example .env
```

The contents of `.env` will contain sensitive information which we must keep
secret! Add the following lines to `.gitignore` to keep these values out of
version control.

```no-highlight
# .gitignore

!.env.example
.env*
```

## Load

Load the environment variables defined in `.env` into your current shell session.

```bash
$ export $(grep -v '#.*' .env | xargs)
```

Then, verify.

```bash
$ printenv | grep ^DATABASE_URL
```

[[source](https://gist.github.com/mihow/9c7f559807069a03e302605691f85572#gistcomment-3309757)]

You can define this as a bash function, if you find it useful.

```bash
# ~/.bashrc

# usage: loadenv [filename]
loadenv() {
  local filename=${1:-.env}
  [[ ! -f "$filename" ]] && { echo "$filename not found"; return -1 }
  export $(grep -v '#.*' "$filename" | xargs)
}
```

## docker-compose


