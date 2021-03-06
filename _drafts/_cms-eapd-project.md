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


## Tuesday, September 15th, 2020

### Slack

```
I want to share this with you, since I shared it with Jon at our 1-on-1, and I would hate for it to appear that I'm talking trash about our project behind anyone's back...

I'm a bit frustrated at the current state of the app. Normally, I would expect to find patterns to follow in order to "slice the layers" of the app to build out new functionality. For example, if design asks to add a new page to an APD, or to add a new field to a section of an APD, I would expect there to be examples of how to change a component, change the redux layer, change the middleware layer, change the api layer, etc, to implement this change. Looking at past PRs, I'm unable to find such examples.

I haven't mentioned this to you yet because (1) you're deep into the Okta integration, and don't necessarily need to hear about other problems right now, and (2) I don't really like to complain unless I have a potential solution or two in mind.

#justventing

I shudder at the thought of building on top of what we currently have to create "APD templates" for users to choose and then complete.

The conversation yesterday around building different but similar APDs got me thinking about how there isn't a clear path on how to augment the existing APD document structure, let alone allowing users to roll their own APD document that they can then fill out.
```

### APD work

Use a feature test to slice the stack. - Unknown problems lie in wait, here.

What are the steps involved when adding a new field or a new group of fields to an APD?

Can we get to a place where an APD is described by a collection of schema objects, each schema has a show/edit component, with component text fields defined as json, with a back-end API route? What would it look like to build CRUD layers across the front-end and back-end?

| Software Stack     |
| ------------------ |
| Component-based UI |
| Redux, Middleware  |
| HTTP (Axios)       |
| API (Express)      |
| JSON Schema        |
| KNEX Querybuilder  |
| Postgres Database  |

Does it make sense to store a JSON object in a relational database? Would we have
a better experience with something like mongo since we're mostly passing around JSON data?

Why does this feel like a bunch of technology thrown together by a 5-year-old? - don't be negative.

We're all losing our minds, watching the fall of democracy and representative government in real-time, live-streamed over the internet. I'm supposed to focus on my work and be productive? Are you serious?

---

This thing is a fucking tangled mess. Fuck this shit.
