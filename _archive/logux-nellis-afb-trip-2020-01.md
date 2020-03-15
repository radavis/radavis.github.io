# Nellis AFB Trip: January 2020


## Wednesday, January 22nd, 2020, 7AM-11AM

**Shadowing Crew Chief Zion Littlejohn**

* Task Delegation: n/a, did not observe
* Equipment Checkout:
    - Had to leave post to swap out a dead iPad for one with a fresh charge.
* Launch Preparation:
    - Remove flagged items from aircraft, engine intake cover, exhaust cover, etc.
    - Review Discrepancies/Corrective Actions and other Aircraft documentation with pilot.
    - Check aircraft wing and tail movement.
    - Perform a number of checks of the aircraft while communicating with the pilot in the cockpit via a headset plugged into the aircraft.
    - Remove grounding cable.
    - Remove wheel chocks.
* Jet Launch:
    - Use hand signals to direct pilot.
* Downtime:
    - Wait.
    - Watch aircraft take off.
    - Chat w/ other Crew Chiefs and AMU staff.
    - Help out other teams of the flight-line (e.g. - help move large maintenance equipment around).
    - Zion commented that today was a slow day.
    - Learned that the Swing shift does much of the data entry (from paper form into IMDS/Brice).
* Jet Recovery:
    - Guide aircraft into "Sun Shade".
    - Install wheel chocks, pins, grounding cable, ladder, covers, etc.
    - Record Discrepancies/Corrective Actions into Binder.
        * Fuel low/Refueled Aircraft.
        * Excessive tire wear/Replaced Port-side Tire. (not observed, just an example).
    - Pilot logs flight time.
    - Fuel consumption logged and calculated (check that miles travelled and fuel consumption is not out of bounds of expected value).
    - Inspect tires.
    - Send oil chip (?) for testing/inspection.
* Document Inspection:
    - Occurred Pre-flight & during downtime.
* Shift Close: n/a, did not observe.
* Forms Binder:
    - Zion commented that he didn't see a problem with logging via pencil and paper in his binder. AF/Military personnel are conditioned to follow a strict process. In my opinion, convincing AF/Military personnel to deviate from their established processes (e.g. - pencil + paper documentation to digital data entry on the flight line) will be difficult.


## Thursday, January 23rd, 2020

**Shadowing John "Cody" Abston on IMDS**

* IMDS (Integrated Maintenance Data System) is a UNISYS Mainframe application used to catalog and document all of the maintenance that is performed on Aircraft.
* IMDS-CDB is the web interface into the terminal-based IMDS software.
* Information in IMDS is separated into "pages", "screens", or "forms" that can be accessed and queried by different fields, such as Aircraft Tail Number, Work Center, and Date Range. (Note: pages, screens, forms are terms that seem to be used, interchangeably.)
* IMDS Pages/Screens:
    - 380 - Documented Maintenance List, view open maintenance events
    - 122 - Maintenance Snapshots, shows all maintenance actions on a JCN (Job Control Number).
    - 922 - On Equipment Maintenance, shows line items of maintenance performed. Fields: Maintenance Code/Status, WCU/LCN, Corrected By, Discrepancy, WCE Narrative, Corrective Action, UP (Units Produced) if 00 time spent, if 01 work completed.
    - 100 - QDR, Maintenance Actions Review Inquiry.
    - 781-A, 781-K, 781-J, 781-H - Forms/Pages Crew Chiefs seems to be most concerned with.
    - 54 - Lookup by JCN
* Master Sargent Meily @ Gunner AFB: Main Point of Contact for Brice v1 (iOS application). GET IN TOUCH WITH THIS PERSON SO WE CAN PICK HIS BRAIN.
* DISA Purebred - DOD-approved auth for mobile devices.
* YubiKey - a hardware authentication device
    - load CAC certificates onto YubiKey
    - plug YubiKey into iPad
    - one YubiKey per officer
    - possible FOD (Foreign Object/Debris) concern


**Usability Testing with Brandon/Level 5**

* All steps in scenarios 1 and 2 were a pass.
* What terminology would you use for "un-defer"?: "un-deferred" or "make active".
* Brandon has used Brice before (for a day or so).
* Scenario 1 Feedback
    - Adding a document number ("order number") would be helpful.
    - Screen 71 input document number -> Screen 54 input JCN
* Scenario 2 Feedback
    - With a static wick, there can be no more than two missing per side of the aircraft.
    - An option to sign off would be helpful (fields: Corrective Action, Completed By, etc)
    - Q: "How often do you defer something?" A: Often. (Use Diagonal or Dash Status Code).
* Overall Feedback: Feature is realistic and helpful. Thinks it's a good idea.
* Q: "When would you have a document number?" A: When creating the Job.


**Chat w/ Jason Griggs, John "Cody" Abston, and Alex Bradley @ Lunch**

This was a chance to recap the past two days of shadowing, and talk about some
of the concerns around the application of technology in this specific instance
(e.g. - Giving Crew Chiefs iPads and asking them to do data entry).

* Me: "The app must be better than pencil and paper."
* Zion Littlejohn: Didn't see a problem with logging via pencil and paper in his binder. I took that to mean that he doesn't see the value in performing data entry on an iPad while on the flight line.
* Crew Chiefs fall back to pencil and paper when the application doesn't work.
    - App is broken (e.g. User Authentication doesn't work)
        -> User falls back to pencil + paper.
        -> Trust is lost.
    - App gets fixed
        -> Users do both pencil + paper forms AND digital forms for fear of losing information.
        -> Are we saving them time, or wasting their time?
* Technology can, and will fail.
    - iPad battery dies
    - iPad can't be used in severe conditions (e.g. - extreme heat/cold, rain)
    - Network connectivity goes down/WiFi is not reliable on base.
    - Imagine using Paper vs. Tablet in a combat zone. Which would you rather have?
* (Military) Users are resistant to changes in process.
* Me: "Can we be better than pencil and paper in this environment with these constraints?"
* Griggs brought up the idea of Machine-Readable Forms, such as Tax Forms, as a
possible way to help streamline data entry.


## Other Important Observations/Information Gathered

* LogUX
    - A series of microservices, each designed and built for a specific role within an AMU.
* Goals/Requirements of the Brice Application
    - To move away from IMDS for data entry.
    - Build a layer of software on top of IMDS, G081, and other systems in order to
    offload the task of data entry from roles within AMUs (Aircraft Maintenance Units).
    - Scale to the Davis-Monthan (DM) and Warner Robins (WR) Air Force Bases.
    - Authentication via CAC (by either physical card or software certificate).
    - Device agnostic/Browser agnostic.
    - Utilize Open-Source Software in development to avoid Vendor Lock-in.
    - Handle poor network or no-network conditions gracefully.
    - Integrate User Management. Allow a DBM to grant Authorization to users.
* Crew Chief
    - Considered the "General Manager" of an Aircraft.
    - Is assigned to a single Aircraft.
    - Calls in specialists ("Specs"), as necessary. e.g. - Fueling specialist, Engines specialist.
    - Their main responsibility is ensuring the aircraft is ready to fly.
    - Documents "Discrepancies" (work that needs to be done), and "Corrective Actions" (work that has been done) in 781 forms in a Binder.
    - Codes: Indicate the type/severity of a discrepancy
        * Dash: '-'
        * Diagonal '\'
        * Ex: 'X'
* Aircraft
    - The first two digits of a tail number indicate the year of manufacture.
    e.g. - "89015" -> Manufactured in 1989.
    - "Aircraft Sun Shades" are where the jets are parked and Crew Chiefs are
    stationed while they work.
* IMDS
    - Each AFB has its own instance of IMDS, identified by its ELC (Enterprise Location Code).
* IMDS DBM (Database Manager) Role
    - handles new user data entry
    - gives/revokes authorization to users (assigns a UID to a Unit)
    - typically one or two DBMs per Air Force Base.
    - can add fields and screens to IMDS-CDB (I think).
* Work Center, Examples:
    - Sheet Metal
    - Weapons
    - Engines
    - Electrical

## References

* My personal notes
* [IMDS Flashcards by Karina V.](https://www.studyblue.com/notes/note/n/integrated-maintenance-data-system/deck/1735178)
* [IMDS-CDB Flashcards by carlton_thomas5](https://quizlet.com/157332055/system-identification-imds-cdb-flash-cards/)
* [DISA Purebred](https://disa.mil/NewsandEvents/2019/Purebred-mobile-security-solution)
* [Air Force Instruction (AFI) 21-101: Aircraft and Equipment Maintenance Management](http://www.mindelfamily.com/Military%20Items/AFI21-101%20Apr%202010.pdf) - April 2010
