# Home/Facility Dashboard

Idea: Create a web dashboard to display a configurable grid of information.

* iframe
* weather
* camera
* sensors: temperature/humidity/pressure/air-quality/door-switch
* power consumption (instantaneous and over time)
  - device level
  - building/floor/facility-level
* traffic
* power grid status
* utilities (reported consumption vs. measured consumption)


## Components of the Business

Hardware, Software, and Service.

* Web Dashboard
  - Authentication/Authorization
  - Users and Groups and Access Rules
* Ethernet/WiFi Devices (camera, env-reading, power monitoring)
  - Bill of Material
  - Schematics
  - Assembly Instructions/Diagrams
  - Installation Guides
  - Software
* Device & Network Installation
  - Planning
    * Where will ethernet drops go?
    * When can we do the install?
    * How long will it take?
  - Tracking
  - QA
  - Follow-up


## Delegating Tasks

* Always keep in mind, how would I delegate this idea?
* Shape the idea.
  - What are the inputs and outputs?
  - What physical parts are involved?
  - What is the ideal goal state?
* Delegate the task.
  - Communicate the necessary deliverables (Schematics, code, etc).
  - Set a deadline.
* Review deliverables.
  - Critique output.
  - Reward excellent work.
  - Determine the next step in the process.


## MVP of this Business Model

* Customizable Web Dashboard
* Temperature/Humidity Monitoring
* Power Monitoring
* Video Integration


## User Stories

* Add a Device (by UUID)
* Group Devices (Dashboard)
* Sign In
* Group Users (Company, Organization)
* Device posts readings to API


## Data Model

### First Pass (core functionality)

* devices
  - id
  - latitude
  - longitude
  - type [ths, pm]
  - created_by_id
* users
  - email
  - uid
  - provider
* measurements
  - device_id
  - value
  - units [F, C, %rh, W]
* dashboards
  - name
  - created_by_id
* dashboard_devices
  - dashboard_id
  - device_id
  - created_by_id

### Second Pass (sharing information)

* companies
  - name
  - address
* company_users
  - company_id
  - user_id
* company_dashboards
  - company_id
  - user_id
* company_invitations
  - email
  - created_by_id
  - delivered_at
  - accepted_at
  - user_id
