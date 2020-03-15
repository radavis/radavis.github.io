# LogUX

[Master Spreadsheet](https://docs.google.com/spreadsheets/d/1ZjWgy4nWTo8Zawl5whINL_lw5KePihmTYQJ9g2fVR8M/edit#gid=282090182)

* [okta](https://kesselrun.okta.com/) - username: rdavis, password: long, and unwieldy
* [tracker](https://www.pivotaltracker.com/n/projects/2344023) - email: rdavis@fearsol.com
* [parrit](https://parrit.cfapps.io/login)
* [mattermost](https://mattermost.aoc-pathfinder.cloud/kessel-run) - use okta sso
* [lastpass]() - username: rdavis@fearsol.com
* [contacts](https://docs.google.com/spreadsheets/d/1ZjWgy4nWTo8Zawl5whINL_lw5KePihmTYQJ9g2fVR8M/edit?ts=5daf2422#gid=0)
* [concourse](https://ci.aoc-pathfinder.cloud/)
* [mattermost](https://mattermost.bespinmobile.cloud/ecosystem/channels/bonobur-team)

username: rdavis_fearless


## Need Access

* BESPIN Mattermost
* Zeplin
* Concourse (Security)
* Miro


## Warloc

```
env $(cat .env | xargs) ./run [cmd]
```


## Gaining Access to Military Websites

Visit [militarycac.com](http://militarycac.com/) and download the
[DoD certificates](http://militarycac.com/macnotes.htm#DoD_certificates)

```
http://militarycac.com/maccerts/AllCerts.p7b
http://militarycac.com/maccerts/RootCert2.cer
http://militarycac.com/maccerts/RootCert3.cer
http://militarycac.com/maccerts/RootCert4.cer
http://militarycac.com/maccerts/RootCert5.cer
```

```
security import AllCerts.p7b -k ~/Library/Keychains/login.keychain

# to system (root account)
security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain [cert]

# to user account
security add-trusted-cert -d -r trustRoot -k ~/Library/Keychains/login.keychain [cert]
```

Add Military DNS Servers:

* 4.2.2.2
* 4.2.2.3

```
# on macOS (cloudflare dns & military dns)
networksetup -setdnsservers Wi-Fi 1.1.1.1 1.0.0.1 4.2.2.2 4.2.2.3

# verify
networksetup -getdnsservers Wi-Fi
```


## When Adding a Dependency...

Add a section titled "Security Acceptance Criteria" to the Tracker Ticket.

List the Dependency and what it does.

SecOps will review story before deploying to production.


## Team member notes

M. Sutton

- 1st week - Stated he worked in Java for 8 years. Asked if Strings were
  immutable in Java.
- 12/26/2019 - Couldn't correctly follow step-by-step instructions for
  creating/adding a SSH key to his GitLab account.
- 12/26/2019 - Seems to gloss over details: e.g. - He needed to set a username
  and password in MySQL. He misspelled 'secret' as the password, and needed
  assistance solving the issue.
- Asking people about their political views.
- Thinks everything is a caching issue.
- 1/2/2020 - Found out who to ask in regards to the Hashicorp Vault issue, but
  didn't want to ask for fear of looking stupid, even after being told what to say.
- 1/8/2020 - Didn't understand that completion of a ticket means pushing code
  __AND__ tests to the repository.

## Warloc Offline

* We have a __Web__ Application. Users want to be able to use it offline.

## Warloc Pipeline

* Deploying via a pipeline that is currently under development is a hair-pulling
experience.
* Vault -> CredHub doesn't work. Have to ask someone on the Platform to set
secrets for us?!?
* RADD doesn't work. Doesn't bubble up errors in the UI. (e.g. - click -> nothing happens.)
