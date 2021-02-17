# software simplified

In the early-to-mid 2000s, Max Kanat-Alexander started contributing to Bugzilla,
a project that had "famously messy code." Adding a new feature took months.
Due to it's complexity, open-source developers were abandoning the project.

"[Max] and a small group of new developers on the project re-architected the
existing system piece by piece and shipped slightly improved new versions every
few months." "After three years of fixing up code this way, [they] were pumping
out features." "With an all-volunteer part-time team, no budget at all, and
no marketing whatsoever, [Bugzilla] remained one of the top products in [the] field."

> The difference between a bad programmer and a good programmer is _understanding_.

"[B]ad programmers don't understand what they are doing, and good programmers do."

"[C]ode problems [...] arise almost entirely out of complexity."
"Programming must become the act of reducing complexity to simplicity."
"[A]ll the problems of modern software development arise from individual
developers adding complexity to the system instead of taking it away."

> A good programmer should do everything in his power to make what he writes
> simple for other programmers to use and comprehend.

> Everybody who writes software is a designer.

Replace "designer" with "software designer", or "software architect."

"You _must not_ design by committee."

> The purpose of software is to help people.

"Help," is defined as: "to make it easier for a person to do something; aid;
assist; to do part of the work of.

"The purpose of software is not 'to make money' or 'to show off how intelligent
I am.'"

"[I]t might be theorized that your potential ability to write good software is
limited only by your ability to conceive of helping another."

"[W]hen we are making decisions about software, our guiding priciple can be,
_how can we help_?"

When reviewing tickets, ask, "how would this feature help others?"
"How does this bug hinder others?" These questions help in the following ways:
- It helps resolve uncertaincies.
- It helps the team come to an agreement about the value of the work.
- It helps project leaders priotitize work.
- It can help us decide which features should be removed.

> The Equation of Software Design: `D=V/E`, where
- `D` is desirability
- `V` is value
- `E` is effort

"[N]early all decision in software design reduce entirely to measuring the
future value of a change versus its effort of maintenance." "[T]he only way
to guarantee success is to design your systems such that the effort of
maintenance decreases over time."

> It is more important to reduce the effort of maintenance than it is to reduce
> the effort of implementation.

"When we ignore the fact thta there is a future and make things that 'just work'
in the present, our software becomes hard to maintain in the future."

Don't try to predict the future.

The Law of Change:
> The longer your program exists, the more probable it is that any piece of it
> will have to change.

"The Three Flaws"
1. Writing code that isn't needed.
2. Not making the code easy to change.
3. Being too generic.

> Don't write code until you actually need it, and remove any code that isn't
> being used.

"[O]verengineering [is] when your design makes things more complex instead of
simplifying things."

"Incremental development is a method of building up a whole system by doing work
in small pieces." "Incremental design is similarly a method of creating and
improving the system's design in small increments."

The Law of Defect Probability:
> The chance of introducing a defect into your program is proportional to the
> size of the changes you make to it.

"[D]efects violate our purpose of helping people."

Richard's Law of Code Review Comments:
> The number of comments on a merge/pull request is inversely proportional to
> the number of lines of code that make up the merge/pull request.

The conflict between the Law of Defect Probability and the Law of Change explains
why we need good design.

> The best design is the one that allows for the most change in the environment
> with the least change in the software.

> Never 'fix' anything unless it's a problem, and you have evidence showing that
> the problem really exists.

Premature Optimization. aka - solving problems that don't exist.

The Law of Simplicity:
> The ease of maintenance of any piece of software is proportional to the
> simplicity of its individual pieces.

"[T]he most important thing we can do that will reduce the effort of maintenance
in the Equation of Software Design [is to] make our code simpler."

"How simple to you have to be?" "Stupid, dumb, simple."

"[W]hen you make your product or code stupidly simple, you're allowing people to
understand it." "[T]he target audience for code is _other programmers_." "Do I
want people to understand this and be happy, or do I want them to be confused and
frustrated?"

On consistency: "If you do something one way in one place, do it that way in
every place."

Simplicity requires design: "Without attention paid to design, a system will
evolve into a massive, complicated beast."

Next: Complexity.

Ways of adding complexity, besides adding features:
- expanding the purpose of your software
- adding programmers
- changing things that don't need to be changed
- being locked into bad technologies
- misunderstanding
- poor design or no design
- reinventing the wheel

"Many difficult design problems can be solved by simply drawing or writing them
out on paper."

On unfixable complexity: hide it, abstract it away.

On rewriting a project: don't. "[T]he correct thing to do is to handle the
complexity of the exiting system without a rewrite, by improving the system's
design in a series of simple steps."

The Law of Testing:
> The degree to which you know how your software behaves is the degree to which
> you have accurately tested it.

> Unless you have tried it, you don't know it works.

"[Y]ou don't want to have to manually test your whole program every time you
make a tiny change. So, in modern times, developers usually apply this law by
creating automated tests for every piece of code that they write."

Summary:
- "It is more important to reduce the effort of maintenance than it is to reduce
  the effort of implementation."
- "The effort of maintenance is proportional to the complexity of the system."
