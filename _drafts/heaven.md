# Heaven

[repo][1]

* Receives GitHub Deployment Events (or GitHub Webhooks)
* Runs deployment jobs as background tasks
* Captures STDIN & STDOUT of the deployment job
* Posts results of deployment job to a GitHub Gist

## Provider

Takes code from GitHub and does something with it (trigger a build, deploy to an environment).

Runs inside of a resque job w/ a configurable timeout (DEPLOYMENT_TIMEOUT env var in seconds).

**Capistrano Provider Options**

* environment - the environment to deploy to
* branch - the git branch to deploy
* task - the capistrano task that should be run to deploy the app (defaults to `deploy`)

Basically, we are building the command...

```
$ bundle exec cap [ENVIONMENT] -s branch=[BRANCH] [TASK]
```

See `heaven/lib/heaven/provider/capistrano.rb:35`.

## Chat Notifications

Slack support!

## Clone Repo and Deploy

```
$ git clone https://github.com/atmos/heaven.git
$ cd heaven
$ git remote add heroku https://git.heroku.com/workbar-heaven.git
$ git push heroku master
```

## Configuration

Set the following env vars via `heroku config:set KEY=value`

* [x] Set `DATABASE_URL` - Heroku takes care of this
* [x] Set `REDIS_URL` - Heroku takes care of this (or run `heroku addons:create heroku-redis:hobby-dev`)
* [x] Set `GITHUB_TOKEN` - A [personal access token][2] from GitHub
* [x] Create an [OAuth application][3] on GitHub (e.g. - workbar-heaven). This will allow GitHub team members to view the resque worker queue on the deployed Heaven application.
* [x] Set `GITHUB_CLIENT_ID` and `GITHUB_CLIENT_SECRET` to values specified by the OAuth application on GitHub.
* [x] Set `GITHUB_TEAM_ID` (e.g. - workbar-dev)
* [x] Set `RAILS_SECRET_KEY_BASE` (e.g. - copy output of `rake secret`)
* [x] Generate a public/private rsa key pair: `ssh-keygen -t rsa 4096 -c "developer@workbar.com" ~/.ssh/workbar_developer_rsa`
* [x] Set `DEPLOYMENT_PRIVATE_KEY` with the private key from the previous step.
* [x] Add the public key to the `~/.ssh/authorized_keys` file on the server(s) you would like to deploy to.
* [x] Set the repository in the Capfile to a https source (not git)
  - `set :repo_url, "https://github.com/workbar-dev/wobbe"`
* [x] Add deploy key to application: `github.com/:org/:repo/settings/keys`
* [ ] Change `DEPLOYMENT_TIMEOUT`, if necessary
* [x] Set `SLACK_WEBHOOK_URL`, `SLACK_BOT_NAME`, and `SLACK_BOT_ICON`

## Testing

* Watch the logs: `heroku logs --tail`
* Trigger a [GitHub Webhook](https://developer.github.com/webhooks/)

## PubSubHubbub

Or, [PSHB][4], aka WebSub, is a simple publish/subscribe protocol. Allows a server to register to receive updates when a "topic" is updated. Updates are sent via HTTP POST to a callback URL.

[How to publish and consume WebSub][5] on indieweb.org

## Questions

* Do we need to create a separate service to trigger a GitHub Deploy event? -- The answer to this seems to be, "yes."
* Can we use PubSubHubbub (or some PubSub service) to have GitHub merges into master trigger a GitHub Deploy event?
* How does Heaven know which Provider to use?

## Idea

Create a Sinatra app to
* watch all github events
* trigger new github deploys when a merge to master occurs

## Scratchpad

```
curl -X GET "https://api.github.com/repos/workbar-dev/pegasus/deployments?&client_id=Iv1.bf42b23ff0cba362&client_secret=01bd2851d4eb362dbf165f283a06bac2181d22da"

GITHUB_CLIENT_ID="9b8fdd9e3a00aeed991c"
GITHUB_CLIENT_ID="Iv1.bf42b23ff0cba362"
GITHUB_CLIENT_SECRET="ff86f613f3a7c20e408c3c57d84901f0961cfcfa"
GITHUB_CLIENT_SECRET="01bd2851d4eb362dbf165f283a06bac2181d22da"

GITHUB_CLIENT_ID:     e1b7dacaa3c408f30382
GITHUB_CLIENT_SECRET: 04f6b38cbe8787966e616ff2b5387359f3829651


"ref=master&task=deploy&environment=qa"

curl -i -H "Authorization: Bearer eyJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE1MTg4MTY2NDAsImV4cCI6MTUxODgxNzI0MCwiaXNzIjoiOTE4NyJ9.eCLM33Nsj8blkqVCAg5ffhMfQV78wrVm7UhIKeGu_Lwu5fTs3b75Ipgwzf9_pJiLad46h6O2l2Jmqv22OInsQPI7M-pjRg3TzV6J9u6FXlcvmNHCCrl5cHmxn4wDRlnPBKxZJ93ohqcNCzwqjZm_UP7nOceloBlOXRPFZPoC_89D0RhyOxZivIIAPSt7ZsU2VeZ0OYjhKkPvHpJGHie_yg5-iiTUKYlgin_1gMWlbEO56kFkreOG_GkarHllaWpowBXnSsa_M8xHdtOJo29LA8dPHz4TluzI2OTgWL_5F44dtnWPPIpaX34WfE90xNQiOrdsUbxH1QOf0Ts0p0WNhg" -H "Accept: application/vnd.github.machine-man-preview+json" https://api.github.com/repos/workbar-dev/pegasus/deployments
```

[1]: https://github.com/atmos/heaven
[2]: https://github.com/settings/tokens
[3]: https://github.com/settings/developers
[4]: https://github.com/pubsubhubbub/PubSubHubbub
[5]: https://indieweb.org/How_to_publish_and_consume_WebSub
