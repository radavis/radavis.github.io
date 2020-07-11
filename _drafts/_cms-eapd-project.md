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

cd api
rm -rf node_modules
npm i

cd ../web
rm -rf node_modules
npm i

cd ../
rm -rf pgdata/*

docker system prune -a
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
