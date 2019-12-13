# LogUX

[Master Spreadsheet](https://docs.google.com/spreadsheets/d/1ZjWgy4nWTo8Zawl5whINL_lw5KePihmTYQJ9g2fVR8M/edit#gid=282090182)

* [okta](https://kesselrun.okta.com/) - username: rdavis, password: long, and unwieldy
* [tracker](https://www.pivotaltracker.com/n/projects/2344023) - email: rdavis@fearsol.com
* [parrit](https://parrit.cfapps.io/login)
* [mattermost](https://mattermost.aoc-pathfinder.cloud/kessel-run) - use okta sso
* [lastpass]() - username: rdavis@fearsol.com
* [contacts](https://docs.google.com/spreadsheets/d/1ZjWgy4nWTo8Zawl5whINL_lw5KePihmTYQJ9g2fVR8M/edit?ts=5daf2422#gid=0)
* [concourse](https://ci.aoc-pathfinder.cloud/)

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

Add Military DNS Servers:

* 4.2.2.2
* 4.2.2.3


## When Adding a Dependency...

Add a section titled "Security Acceptance Criteria" to the Tracker Ticket.

List the Dependency and what it does.

SecOps will review story before deploying to production.
