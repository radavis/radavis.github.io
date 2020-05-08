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
