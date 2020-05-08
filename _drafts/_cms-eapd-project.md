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


## Useful commands

postgres development console (after running `docker-compose up`)

```
$ psql postgres://postgres:cms@localhost:54325/hitech_apd
```

show express routes

```
$ DEBUG=express:* node index.js
```

update documentation diagram written in mermaid

```
$ npm install -g @mermaid-js/mermaid-cli  # install mermaid-cli
$ mmdc -i diagrams/auth.verify.mmd -o diagrams/auth.verify.png
```


## 2100

### Branch: remove-request-node-module

* `request` is deprecated: https://www.npmjs.com/package/request
* We use axios on the front-end. Why not use it when testing the API, as well?
* Tests needed to be refactored in order to accomodate the move from cookie auth to token auth.
* Condensed the two `endpoint.util` files into one.
* Moved call to `multer` to `routes/apds/files.js`. It shouldn't be used as global middleware according to the docs.
* TODO: fix `endpointCoverageMiddleware.js`


## Next

* [Budget Table Math](https://app.mural.co/t/gsa6/m/gsa6/1585942490744/d53ca4663eff051ca34dada15dc3d0172474eec8)
