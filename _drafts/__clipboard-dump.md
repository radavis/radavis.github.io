I just use a series of dongles and adapters connected to each usb-c port, so my laptop looks like an octopus

Balance: 8
Last 24-hours: issue #2104 - Worked on refactoring the SaveMessage component and tests. Up for review. issue #2100 - Read about Authentication in the app so I can work on this story.
Next 24-hours: Need to figure out what's up with the deployment bot. Wrap up #2104, determine approach for #2100
No impediments.

npm run test -- --watch
yarn test --watch

I wasn't quite sure how to articulate what I was thinking during our meeting yesterday. Looking back at it, I feel that way we were talking about testing was too high-level and abstract for me. Possibly, that was the point; so that we could get to something more concrete. Here's how I understand things:

Our customers are (typically) government employees. They come to us with a problem that they want solved with technology. How does Fearless use testing to 1) discover a possible solution to their problem. 2) How do we use testing to ensure that we deliver a quality product that meets the needs of their stakeholders. 3) How do we use testing to work collaboratively on extending that product with a high-confidence we are not breaking any existing features.

When looking at 'Testing' from this lens, it's quite a broad term. There's Usability testing, unit/integration/acceptance testing, performance testing, test plans, and and so on, with a wide variety of roles at play.

The cool thing about this problem we face is that Fearless has been around for 10 years. We have plenty of projects to pull from and plenty brains to pick. What kinds of solutions have we developed? How did we approach testing for that contract? Who where the people that worked on the project? What were their roles? What they think about the way the team approached testing for that project? And, the most important question: Was our customer satisfied with the results? (e.g.- Did they come back to us for more work, or recommed us to another agency or department?)

I'd love to see a series of talks or write-ups approaching the problem of defining how Fearless has done testing, from this front. Then, collectively thinking about them, understading what went right, what went wrong, and exploring potential alternative approaches, with the focus on 'value delivered to the client.'

Balance: 8
L24: Wrapping up documentation for [#2100](https://github.com/18F/cms-hitech-apd/issues/2100) - Auth refactor.
N24: Digging into [#2131](https://github.com/18F/cms-hitech-apd/issues/2131) - Budget table bug, and [#2169](https://github.com/18F/cms-hitech-apd/issues/2169) - Updating the Budget reducer.
Asks: @jeromeleeCMS, when you have a moment, could you take a look at https://ec2-34-201-43-187.compute-1.amazonaws.com and verify you can log in and out. Then approve this PR: https://github.com/18F/cms-hitech-apd/pull/2158 ? Thanks!
Blockers: none

I've been bouncing around on the emotional spectrum between "I've got this" and "I'm a complete idiot, why did I choose this career?" so, I'm not sure how I'm doing. I've just been taking lots of breaks to make sure my brain has enough space to attempt to complete some work.

Remembering back to my first Fearless project, we had an nginx service that sat in front of our app that handled auth. If they were unauthorized, the request failed (4xx HTTP response). Otherwise, a header was included in the request with the username, permissions, and other user data.

I’m fairly new to the ATO process. From my understanding, it’s necessary to satisfy the following NIST Security Controls to qualify for ATO. https://nvd.nist.gov/800-53 So, if you can satisfy these requirements with a passwordless app, you're good. (Apologies if I'm stating the obvious.)

Balance: 8
L24: Apologies for missing our meetings, yesterday. I tried to complete some "quick" errands over lunch, which turned out to be not-so-quick...
N24: Understanding/executing on [#2169](https://github.com/18F/cms-hitech-apd/issues/2169) - Updating the Budget reducer, [#2170](https://github.com/18F/cms-hitech-apd/issues/2170) - State Costs Summary Table.
Asks: Could the team look at my questions, [here](https://app.zenhub.com/workspaces/cms-hitech-apd-5a3823ad3659e94d8ee569be/issues/18f/cms-hitech-apd/2169), please?
Blockers: none

Amazon Web Services ships serverless services so that you can serve your service
without servers.

The biggest things for me are: 1) What is the business value? and 2) What does “done” look like?

Using #2188 as an example, I don’t know if adding visibility to sub-sections within the nav actually brings any business value to to the table. It might actually be beneficial to leave out the details of showing subsections within the nav until the user needs to see these sections. The ticket doesn’t currently convince me that the suggested change would bring any value to the user, other than bringing consistency in showing all the parts of an APD at all times (but is more detail a good thing, in this case?). This is labeled as a bug, but feels more like a feature, especially since the application is working as intended (by hiding detail when it isn’t necessary). If this task had a well written User Story, I might be convinced that we are adding some business value that the end-user will benefit from. Right now, I’m not seeing it.

The biggest things for me are: 1) What is the business value? (a well-written User Story can convey this.) and 2) What does “done” look like? (e.g.- What is the checklist of things the user can do within the UI to satisfy these requirements?)

Using #2188 as an example, I don’t know if adding visibility to sub-sections within the nav actually brings any business value to to the table. It might actually be beneficial to leave out the details of showing subsections within the nav until the user needs to see these sections. If this task had a well written User Story, I might be convinced that we are adding some business value that the end-user will benefit from. Right now, I’m not seeing it.

The checklist for "done" is a bit nebulous.

Balance: 4
L24: [#2229](https://app.zenhub.com/workspaces/cms-hitech-apd-roadmap-5d892d19ae87b60001505839/issues/18f/cms-hitech-apd/2229) "Don't allow negative FTE numbers" is ready for review.
N24: Trying to figure out how to fix the Sidebar VerticalNav without breaking all of the links and the previous/next buttons. [#2188](https://app.zenhub.com/workspaces/cms-hitech-apd-roadmap-5d892d19ae87b60001505839/issues/18f/cms-hitech-apd/2188)
Asks: Have a great weekend, y'all!
Blockers: none

Balance: 4
L24: #2246, #2251
N24: Merge in PR for #2289. Working on getting the PR for 'Use "target completion date" for milestones' #2246 completed.
Asks: none
Blockers: none

Balance: 6
L24: PR for #2251 "Start Date/End Date changes" is up for review. Created and issue & PR for some tech debt related to the developer experience: #2309.
N24: Gonna knock out the #2288 styling story, and then wrack my brain on the nav issue story #2188.
Asks: none
Blockers: none

Davis, Richard – Welcome to CMS.

You need a User ID and password to access CMS’ and other Federal systems.

We have created a User ID for you (see below). You will need to create a temporary password to log into the Enterprise User Administration (EUA) site.

Once you log into the EUA site, you will need to create a new password that is effective for 60 days and also complete five (5) security questions.

You will also need to complete the CMS Information Security & Privacy Computer Based Training within the next three (5) business days.

Your User ID: DXVN. Your Next Steps

1. Create a Temporary Password: Create a temporary password: Your temporary password is the first two letters of your last name (capitalize the first letter) + the last six digits of your Social Security Number. You must use the last name from your official CMS record. Example: Jane Taylor has a SSN of 111-22-3333; her first password would be Ta223333.

2. Access the EUA Site to Create a New Password Access the EUA site: Use your User ID and your temporary password to access the EUA Site. You can also use the new password reset icon on your desktop to reset your CMS password. When you click the icon, the EUA home screen will open up. Once you login with your existing password, you’ll be prompted to change it and when you restart Outlook, Lync and other desktop applications, your new password will be synchronized. Tip: It is a good idea to bookmark the EUA site, since you will need to change passwords every 60 days. Create a new password: Once you have logged into the EUA site, click on the “Change Password” icon. Follow the password guidelines detailed on the “Change Password” page to create a new password. You must also provide responses to the five (5) security questions on that page. Your new password will be effective for 60 days. You will receive email reminders to update your password before this password expires.

3. Complete the CMS Online Training and Know Your Responsibilities Training: CMS requires that all users take the Information Security & Privacy Computer Based Training (CBT). Within the next five (5) business days, you must complete the online training in the ISPG Training Portal. Compliance with the CMS Privacy Act Statement: You signed the CMS Privacy Act Statement in your registration, and CMS requires you to comply with it. You are responsible for all activity under this user account. The combination of your User ID and password may serve as your “electronic signature” for accepting material. You must keep your password secret. Get help if you need it

1. Read our USER Guide for EUA located in theEUA Documentation Repository

2. Contact your CMS Access Administrator (CAA) for help. A list of CAAs can be found in the EUA system (link to CAA List).. Once you have logged in scroll down the page until you see EUA Info on the left hand side (Under Tasks box). Click on the CAA Listing button and search for CAAs using the “Org Path”, entering CMS organization (Component/Office or Group) and clicking on the Search button.

3. Contact our IT Service Desk at 800-562-1963. DO NOT REPLY TO THIS EMAIL. This email is generated from an unattended mailbox.
