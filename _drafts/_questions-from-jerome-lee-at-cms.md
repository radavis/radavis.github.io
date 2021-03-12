# Questions from Jerome Lee

1. (a) Did you feel like you understood the scope and work of the project?

As an Engineer at Fearless, after being assigned to the project but before joining the project, no. My knowledge of the project was that it was an Express/React.js app.

After a month or two on the project, sure; Building forms so that states can plan their federal medicare funding.

1. (b) Were there any gaps in your knowledge that would help you or a member of the team be set up for success?

None that I can think of.

2. Were there any process improvement things you really wished we could have implemented?

I would spend more time on grooming tickets, flesh them out a little more thinking about what we do and do not have within the codebase. For example, if a ticket requires adding a new API path, authorized only for a particular role, we should ask, "Do we have the ability to scope authorization to user roles?" No? Let's create another ticket that addresses this singular problem, and make it a priority.

Perhaps this will come with time. I see how adding this process would be difficult with small teams coming up to speed in a codebase.

3. Were there any technical improvements that you really wished we could have implemented?

Yes.

- Use a framework instead of piecing together npm libraries. In the case of eAPD, we have a custom stitched-together solution. While it serves its purpose, it can become resistent to change (**ahem** _tickets-divisible-by-100_), and it can take longer to understand. You also end up solving problems that others already have solved, us without the benefit of peer review (e.g. - routing + anchor tags with ids, webpack configuration, code organization, ...). I don't think that React frameworks, such as Next.js, were well-known or well-featured when eAPD was started, so I can understand how we got to the present.

- Come up with an organizational system that "pairs" forms and print views within the codbase. If I need to change a form, it should be in close proximity within the filesystem to the view that presents that information. Possibly even going as far to encode this into tests so that when I change the form, the a test fails telling me to update the print view. This shouldn't be a manual check.

- Consistent naming and organization of components. (I'm pretty sure this is already on Tif's radar)

- Refactor Redux. There's been a good effort do simplify and organize Redux code with redux-toolkit and the documentation at redux.js.org. As an outsider looking in, redux in this app is very, very difficult to follow. However, this could be my aversion to Front-end Engineering talking.

4. Did you feel like you had sufficient technical / mentoring support to help you be successful with the project?

I don't know that I personally could achieve success with this project. In my mind, a successful software project is one that I don't have to ponder about in the evenings because I couldn't figure it out during the day. Its simple and effective, and scaled to the team's size. Its the realization of software quality through automated testing. When working with small teams, I have only seen this executed in a specific way: write acceptance tests from the user's point-of-view that exercise the entire application. Then, follow an existing design pattern in the codebase to implement the requested feature.

I'm sure there are other paths to software quality. However, they often require teams and talent that are cost prohibitive. After experiencing it for a year, developing on a JavaScript app without a framework is something that I'm not good at, nor is it something I want to continue to do.

5. Anything else?

I'm not sure if you're on LinkedIn or not. "Friend me" if you are! linkedin.com/in/radavis-swe
