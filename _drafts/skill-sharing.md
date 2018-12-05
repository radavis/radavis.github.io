# Skill Sharing

Goal: Figure out a way to connect team members based on skills.


## User Stories

```
As a New Fearless Team Member,
I want to know which employees know technology X,
So that I can pick someone's brain about that technology.

As a Fearless Team Member,
I want to input my skills,
So that others can know what I'm good at.

As a Project Manager,
I want to know how skilled my Fearless Team Members are in a subject,
So that I can be informed of how well my team is staffed to tackle the project at hand.

As a Fearless Team Member,
I want to share a resource with other members of the Herd,
So that we can collectively level-up the skills of the company.
```


## Technologies

* Bulletin Board Systems/Forums: phpBB, Simple Machines, Google Groups, Discourse
* Spreadsheet
* Wiki: MediaWiki, Wikia, Wikispaces, Wikidot, Confluence
* Custom Solution
* Hubot Script


## Services that we currently use

* onelogin - Single sign-on
* 7Geese - OKRs, Performance Management
* Greenhouse - Recruiting
* BambooHR - Payroll, HR, Employee Directory


## Ideas

* List technologies in Slack profile
  - unfortunately, this isn't searchable
* Use employee directory on BambooHR
  - can't search profiles, only names/departments/job titles


## Custom Solution

### Database Schema

* Skills(name, description)
* UserSkills(skill_id, level)
* User(name, email)

### Features

* Sign in via onelogin
* Add a skill and skill level
* Find others who have a skill


## Resources

* [Dreyfus Model of Skill Acquisition](https://en.wikipedia.org/wiki/Dreyfus_model_of_skill_acquisition)
* [Seven Stages of Expertise in Software Engineering](http://www.wayland-informatics.com/The%20Seven%20Stages%20of%20Expertise%20in%20Software.htm)
