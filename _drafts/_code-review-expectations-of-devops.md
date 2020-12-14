Great question!

When it comes to code review, there are a number of different perspectives you could take to help me out.

- Does this Pull Request's Description match up with the Ticket? It should be clear to the reader that the author of the PR has understood the issue outlined in the Ticket, and this PR resolves all the asks of the Ticket. Sometimes, Ticket scope isn't accurate, and excess work is pushed into a separate Ticket. If an ask is unaddressed, was a new ticket created and referenced?

- Does this PR work as advertised? Can you visit preview deploy and observe the changes described?

- Is the intention of the code clear? Are the changes easy to read and understand? I highly value code that is easy to read. If something doesn't make sense, or isn't easy to understand, that is a problem, and I want to fix it.

- Are there backing tests? Are the tests easy to read and understand?

- Are there any code changes that are out of scope?

- When moving from development to preview, or development to staging, are there any changes that need to be made in these environments (e.g. - environment variables, supporting services, supporting libraries)? Are the necessary changed documented appropriately?

Ultimately, my goal is to be able to answer "yes" to "Does this PR satisfy the Ticket?" If there are any concerns that the answer could be a "no," then bring them to my attention.
