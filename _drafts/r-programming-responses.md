# Reddit responses

## What are the first 5 to 10 programs you should learn how to write when learning a new programming language?

* Hello World: Useful for sanity-checking your development environment. This answers the question, "Can I execute code in this language?" It also gives you an example of how to print to the console, which is useful for debugging.
* FizzBuzz: Gives you an example of how to loop and write conditional statements in the language.
* Shopping Cart: Continuously prompt the user to input an item. An empty line indicates they are finished. Store their input in an array. Print the list to the screen when done. Bonus: Write the list to a file.
* Word Counter: Use a hash table/dictionary/associative array to find the most frequently used words in a document. Exclude stop words. Download a book or two from Project Gutenberg for analysis. When working on this challenge, write functions to create reusable chunks of code. (e.g.- Store your stopword list in a file, use the same function to read in the stopword list and the text for analysis.)
* Address Book: Practice simple object-oriented programming by creating a Person class with the following attributes: name, age, address, email, phone number. An array of people objects represents the Address Book. Have the source of this data come from a CSV file. Create an interface to allow you to search the array of people objects by name. Keep the logic for loading the CSV file and creating the address book in a separate file from the Person class.

After completing these challenges, you will have examples of most of the important features of any given programming language.

* variable assignment
* looping
* conditional statements
* declaring functions
* getting user input
* printing to the console
* file i/o
* working with arrays and associative arrays
* defining classes
* organizing code into separate files


## I realized that good programmers focus on how things work while the rest try to patch things together like magic. Am I wrong?

In the realm of software, it is possible to trick yourself that there are people smarter than you.
When you are learning a language, it's easy for someone else with slightly more experience to point out the "obvious" syntax errors: a missing semicolon, a missing parenthesis, a simple typo. Eventually, you convince yourself that there is always someone who knows more than you. There is someone who can glance at your code, and tell you the answer.
So, instead of considering how to solve the problem, you immediately ask why your initial solution didn't lead you to the answer. It is easier to throw your hands up in the air and exclaim, "I don't know!", instead of giving the problem any further thought.
The issue is that, once you get past the task of understanding the language, the problems become harder in a different way. You have to think within the confines of loops, conditionals, methods, and objects. You have to figure out recipes to solve the problem at hand. You must use the constructs available to solve your specific problem. You have reached a point where the problems you must solve have become hard.
Some people are willing to buckle down and figure out how to "think in code." While, others will post redundant questions on Stack Overflow and ask their peers, without trying a few different Google searches to uncover the solutions which others have documented and discovered.
In my experience, the difference between a mediocre coder and a great coder is simply their willingness to persevere in the face of such difficult challenges.


## Currently an webdev intern working on a web-app, and almost all my code has been commented out.

That sucks.
Look at the history. git blame if you are using git. Ask the person why your code was commented out, instead of given a review of how it could be improved.
Software is a conversation. You can't expect someone to get better at this craft without feedback. If your code didn't meet someone else's expectations, they should have the ability (and decency) to tell you why it falls short, and how to improve it. Otherwise, both parties are missing out on the opportunity to share knowledge.
My advice is to learn how to write tests for your code, if you haven't already, and practice writing them. Ask for feedback.
You're in an internship. You have nothing to lose, and everything to gain by showing you want to improve your abilities.


## Confession: I don't put in more than 40 hours

Webdev is known to be a field where you are constantly learning. To limit yourself to working hours is not unreasonable. In fact, in my opinion, it should be the norm. However, this is rarely the case.
I study in the evening, after work. I study in the early morning when I can't sleep. I study on my lunch break while I'm eating. I'm fully dedicated to my career. Maybe this is the wrong mindset, and maybe I'm not practicing my profession in a sustainable way.
It's easy to slip into the mindset that your peers are learning faster than you. It's possible that your peers are so far ahead of you that you could never catch up. You should just quit...
For the love of God/Budah/Satan/whoever, don't. You should only compare your progress to what you were capable of last week, last month, last year. As soon as you start comparing yourself to someone else, you will inevitably lose. It is an unfair comparison. Don't do it.
If you find joy in practicing your profession outside of working hours, then, please do. Otherwise, stick to the 9-to-5.

## Need some HTTPS advice from /r/webdev

> The unencrypted HTTP protocol does not protect data from interception or alteration, which can subject users to eavesdropping, tracking, and the modification of received data.

Source - [US Government](https://https.cio.gov/)

Basically, if a website asks for a user's email address and password, you should be using HTTPS. People use the same email/password combination across websites.

[Why you should always use HTTPS] (https://developers.google.com/web/fundamentals/security/encrypt-in-transit/why-https?hl=en)


Arguments in the tech world can easily get heated. The best approach is to state the facts you know about the subject, give your recommendations, and leave it at that: "I would recommend that the client use HTTPS, since it would prevent eavesdropping on the users of the application. Have you heard of letsencrypt.org? It sounds like an easy way to get an SSL Certififcate."


## Struggling at my job, how do I remember everything?

Q: "How do I remember everything." A: You don't.
I have hundreds of small projects that act as examples on my local machine. This has been built from typing in every code example I come across. I can use grep or the silver searcher to find what I'm looking for. Can't remember exactly how to parse csv? cd ~/code && ag csv.
Google is your friend. StackOverflow is your friend.


## What is the proper way to access active record objects in javascript?

Probably the easiest way is to use a respond_to block in the controller, and render the ActiveRecord object in JavaScript Object Notation (JSON).

So, your JS is going to make an AJAX request for an article, GET /articles/5.json, which will execute the show action in the ArticlesController.

```ruby
def show
  @article = Article.find(params[:id])
  respond_to do |format|
    format.html { render :show }
    format.json { render json: @article.to_json }
  end
end
```

Eventually, you may want to move this functionality to a separate set of controllers, namespaced under /api so that your ArticlesController isn't responsible for rendering both HTML and JSON.


## As a programmer, and more specifically as a web developer, how do you decompress?

Two words: Automated Testing.

Capybara lets me write tests from the users point of view:

```ruby
visit "/articles"
click_on article.name
expect(page).to have_content(article.body)
```

When bugs are uncovered, a test is written to cover that use case.
Integration testing of this sort is awesome. I can test the user-facing functionality of a feature.
Unit testing is important, too. Writing tests for your code on the class and method level is really helpful for identifying and handling edge cases. Also, if you have tests in place, refactoring your code is a breeze.
Since you have described working on your product as playing wack-a-mole, I'm going to assume you have little to no test suite at all. I'm sure if you bring up testing to one of the old hat programmers at your job, they will decree, "Automated testing is slow and inefficient! That's what we have a QA department for!" Ignore that noise. Writing tests is what is going to keep you sane as a developer. When someone tries to call out your code for not working properly, show them the passing test case that proves them wrong. Boom. Their argument is invalid.
As far as decompressing, when you go home, forget about work and what you have to do tomorrow. Live in the moment. Enjoy the things you have, and think about all the hard work you have done to get where you are today.
Oh yeah, and take a vacation. Sounds like you need one.


## What're the top 3 qualities you look for in a colleague beyond their code?

I think most people will answer with something that falls into the "cultural fit" category. Remember, you are going to be spending a good portion of your waking life with your colleagues. You should enjoy the presence of their company. If you don't think you would enjoy spending time with someone, then bail.
