# Centers for Medicare & Medicaid Services (CMS) - Electronic Advanced Planning Document (eAPD)

## TODO

[CMS Onboarding (Fearless)](https://docs.google.com/document/d/1__EQ-MsGmm5jTpCcshiy2YzsAKbF66Qw_3Z2ccAPs7Q/edit)

- [x] Register @ eua.cms.gov
- [x] Wait for CMS EUA ID: DXVN
- [ ] Complete Training @ cms.gov/cbt
- [ ] Complete Records Management Training
- [ ] Upload screenshot of Records Management Certificate, [here](https://confluence.cms.gov/display/BCDA/BCDA+-+Records+Management+Training)
- [ ] Update your EUA password @ eua.cms.gov
- Log into the following services
  * [ ] jiraent.cms.gov
  * [ ] cmsgov.slack.com
  * [ ] confluence.cms.gov
  * [ ] github.cms.gov

- [x] e-QIP Registration Code: 61G23BNJYM7IWT
- [x] OF-306

## Links

* [18F/cms-hitech-apd pipeline](https://app.circleci.com/pipelines/github/18F/cms-hitech-apd)
* [18F/cms-hitech-apd repository](https://github.com/18F/cms-hitech-apd)
* [Authentication (18F/cms-hitech-apd)](https://github.com/18F/cms-hitech-apd/wiki/Development-authentication-and-authorization#Authentication)
* [ZenHub for cms-hitech-apd](https://app.zenhub.com/workspaces/cms-hitech-apd-5a3823ad3659e94d8ee569be/board?repos=113234315)
* [eAPD Documents (Google Drive)](https://drive.google.com/drive/folders/1I_PLtySNwEIICgqaFUi6yyuvX0IpzUIK)
* [eAPD Project Scope](https://docs.google.com/document/d/11cyPx5MvAL05545BGs0SjyH-sImU6k0QInjx0ydSMY0/edit)
* [Records Management Training](https://tod.learning.hhs.gov/courses/recordsmanagement/index.html)
* [US Web Design System](https://designsystem.digital.gov/)
* [Meetings](https://docs.google.com/document/d/1D3ZEwKtmHnyoOCZcg_-XT5feT2iCVgBCDMv20VFsXEs/edit#heading=h.2rbil68u672p)
* [eAPD logic flow](https://app.mural.co/t/gsa6/m/gsa6/1550093095167/6af6517f3e12e173f4df52bc4eb9bb6067725cfd)
* [Team Availability](https://docs.google.com/spreadsheets/d/1O9P67TlPhGE1nbknZckGXXhmwm3QFrZ_3T0ov5ZLHb8/edit#gid=1386256029)
* [Brownbag Talks](https://drive.google.com/drive/folders/1Cynv9pTzEDQEmZQ0q3aDitSpcafgaxhe)
* [Math flows](https://app.mural.co/t/eapd5455/m/eapd5455/1588711183141/acecb4562692e2b1e5bd412411b4d5c540d07b3e)


## Useful commands

postgres development console (after running `docker-compose up`)

```bash
$ psql postgres://postgres:cms@localhost:54325/hitech_apd
```

show express routes

```bash
$ DEBUG=express:* node index.js
```

update documentation diagram written in mermaid

```bash
$ npm install -g @mermaid-js/mermaid-cli  # install mermaid-cli
$ mmdc -i diagrams/auth.verify.mmd -o diagrams/auth.verify.png
```

run migrations

```bash
$ docker-compose exec api npm run migrate
```

revert app to prior release

```bash
git checkout vX.Y.Z

rm -rf {api,web}/node_modules pgdata/*
cd api && npm i
cd ../web && npm i
cd ../

docker rmi --force $(docker images -q --filter=reference='cms-eapd/*')
docker-compose up
docker-compose exec api npm run migrate
docker-compose exec api npm run seed
```


## 2100 - Refactor Authentication (remove cookies)

### Branch: remove-request-node-module

* `request` is deprecated: https://www.npmjs.com/package/request
* We use axios on the front-end. Why not use it when testing the API, as well?
* Tests needed to be refactored in order to accomodate the move from cookie auth to token auth.
* Condensed the two `endpoint.util` files into one.
* Moved call to `multer` to `routes/apds/files.js`. It shouldn't be used as global middleware according to the docs.
* TODO: fix `endpointCoverageMiddleware.js`


## 2169 - Update Budget Reducer Math

* [Budget Table Math](https://app.mural.co/t/gsa6/m/gsa6/1585942490744/d53ca4663eff051ca34dada15dc3d0172474eec8)


## 2188 - VerticalNav Bug

* Updated from @cmsgov/design-system-core v1.32.1 to v3.4.2 back in early January
* Currently at @cmsgov/design-system-core v3.7.0
* When did the VerticalNav component signature change?
  - Can't choose versions @ https://design.cms.gov/
  - Revert app to v2.2.0 (before updating to @cmsgov/design-system-core v3.4.2)
  - I don't think the design system is the issue.
* When did the Sidebar.js Container Component change?


## Breadcrumbs

- import file using relative directory syntax
- add spacing between activity list items, move pr from draft status


## MFA/2FA Auth for ATO

There are multiple concerns to weigh. Sounds like right now we are thinking,
take the shortest path to ATO since effort applied to MFA/2FA (Multi/Two factor auth)
takes away from eADP work.

* [What is 2FA?](https://authy.com/what-is-2fa/)
* [ATO Running Notes](https://docs.google.com/document/d/11HzGywm BwS17h-KxGvPLJV12yusZp4O_CVjkNQ92wjE/edit#)
* https://github.com/okta/okta-signin-widget#okta-sign-in-widget
* [Okta Sign-in Widget](https://developer.okta.com/code/javascript/okta_sign-in_widget/)
* [Okta 2FA Articles](https://www.okta.com/corporate-blog/tag/2fa/)
* https://confluenceent.cms.gov/display/IDM/MACPro-eAPD+-++CMCS+-+IDM+Integration+Meetings
* https://confluenceent.cms.gov/display/IDM/Authentication+Offerings+-+OaaS


## npm-audit-resolver alternatives

* snyk
* AuditJS
* ~nsp~
* greenkeeper

https://snyk.io/blog/ten-npm-security-best-practices/


## Versioning of APDs

There's a table in our database named `apd_versions`, which is described as a
place to store **submitted** APDs. However, it doesn't look like we ever write
to this table. I don't believe we can currently submit an APD through the
interface. On the submit page we have a `mailto:` link to submit a pdf of the APD.

On the frontend, we use something called `jsonpatch` to patch update frontend
APD state.

The Development Backend page in the wiki talks about using `jsonpatch` and
`jsonpointer` to apply changes to the APD data structure. However, it looks like
this is now outdated. This might be a remnant from when the APD was mapped to
a relational structure within the APD, or some forward-thinking from the team
on how to handle versions of an APD.

So, it doesn't look like there's anything in the app currently to handle APD versions on the backend.

 https://github.com/18F/cms-hitech-apd/wiki/Development-backend


## 2335 - Auditing NPM pacakges

Current solution: `npx -p npm-audit-resolver check-audit` in CI.

Problems:
  - fails on dev dependencies, no option to run in `prod` mode
  - excessive noise when failing dependency is common (e.g. - `lodash`)

Try:

```bash
$ npx audit-ci --config
```


## Local Dev Commands

```bash
$ cd api
$ NODE_ENV=development DEV_DB_HOST=localhost npm run start-dev
$ cd ../web
$ NODE_ENV=development npm run start
```


## URLs

production: eapd.cms.gov
staging: staging-eapd.cms.gov
username: rdavis@fearless.tech
password: password-password


## 2188 - Navigation Refactor

Issues

* [x] Clicking Export and Submit skips the review step.
* [ ] Unable to scroll Sidebar/Nav independently from the right-hand page.
* [x] Continue/Previous buttons missing "Activity #" when on the main Activity List.
* [ ] Click top-level navigation label, go to the first page in list.

Open APD
Expand Key State Personnel
Scroll to bottom of the page
Click Key State Personnel (in the sub nav menu)

It should go back up to the top of the page, but it stays in place. The side panel does highlight like it should as you scroll. This does work if you click on State Director and Office Address.

This is also the case for Results of Previous Activities, Proposed Budget, and Executive Summary. It might be related to the main menu item and the sub menu item having the same name.


When navigating with the Continue/Previous buttons, the Left-side Nav does not
automatically expand to the current location. Also, suprise-yellow.

"Suprise yellow" is a feature of the CMSGOV Design System. It indicates screen reader tab location. If you click on a focusable item (e.g. - a button, a link), the screen reader tab focus stays where you last clicked. If you press tab, you move to the next focusable item. If you press shift+tab, you move to the previous focusable item.

Updating the 'selectedId' of the Nav does not update
or clear the focus state, which honestly feels like a bug in the design system.


Because of the way the CMS Design System VerticalNav component works, simply setting
the 'selectedId' will not expand to the current location. You must do that manually.


## Running api tests, from scratch

```bash
nvm use 10

# refresh node_modules
rm -rf {api,web}/node_modules
cd api && npm i
cd ../web && npm i
cd ../

# refresh local docker images
docker rmi --force $(docker images -q --filter=reference='cms-eapd/*')
docker-compose build

docker-compose -f api/docker-compose.endpoint-tests.yml up
```


## psql

```
$ dropdb hitech_apd
$ createdb hitech_apd
```


## update api snapshots

edit `api/endpoint-test/endpoint.sh`:

```bash
# append '-- -u' to line 10, and run
docker-compose -f docker-compose.endpoint-tests.yml exec api-for-testing npm run test-endpoints $@ -- -u
```


## Thursday, September 9th, 2020

I'm currently trying figure out how to modify the `api/schema/apd.json` file  to accomodate a change to the frontend. An Activity goes from having one Other Funding Source, to having one per FFY. I need to modify the structure of the schema to reflect this change.

I have tests in place to validate the seed apds. So, my approach has been to modify a seed file (`api/seeds/test/4000.json`), and run the test. My next step is to change the apd schema so that I can store something like

```js
{
  year: "2020",
  otherSources: "<p>...</p>"
}
```

within the `costAllocationNarrative` property of an `activity`.

I'm getting lost in `api/schema/apd.json`. I think I need to break it into smaller pieces. I'm having a difficult time reasoning about and modifying a deeply-nested, 600-line, json document definition.


I'm also having serious difficulty focusing lately. So, my brain isn't doing me any favors.
