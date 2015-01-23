Park Bench
==========
Consume data from [Numbers API](http://numbersapi.com). We are not directly consuming this API we are
consuming this via [Mashape](http://mashape.com).

PROBLEM OVERVIEW
----------------
Create your project in a public repository on github.com, and invite Park Bench developers as collaborators on
that repository. Your changes should be committed to the 'develop' branch and pull requests should be opened on
the repository's master branch.

FUNCTIONAL REQUIREMENTS
-----------------------
The main requirement of this project is to consume data from a web based API, then display it in an interesting manner.
Here are some examples of interesting web based APIs:

    • HackerNews API: http://api.ihackernews.com/
    • Github API: http://developer.github.com/v3/
    • Reddit: http://www.reddit.com/dev/api
    • Punch Fork Recipe API: http://punchfork.com/api

These are merely a few examples and by no means the only APIs for the project. Find an API that suits your
interest to keep this project fun.

TECHNICAL REQUIREMENTS
----------------------
Specific technology areas we'd like to see are:

    • Ruby on Rails
    • Authentication, e.g., Devise
    • Paging, e.g., will_paginate
    • User Interface, e.g., Bootstrap
    • Unit tests, e.g., RSpec

Solution
--------

Following gems are used in the project

    • devise
    • will_paginate
    • foundation
    • unirest
    • webmock
    • rspec_rails
    • factory_girl_rails
    • capybara

Summary
-------
* Have used a number API that return interesting facts against a given number.
* unirest has been used for making API calls and stored the response inside the database.
* Have used will_paginate gem for pagination.
* Feature tests have been written for user login, sign up and for searching number fact.

Instructions
------------
* Clone repo to your local dev machine using **git clone https://github.com/bilalnaeem/park_bench.git**.
* This project was build using PostgreSQL but if you want to change to some other db, it should still work, just update Gemfile to use related gem.
* Install RVM.
* Install ruby 2.0.0 using **rmv install 2.0.0**.
* Create gemset using **rvm use 2.0.0@park-bench --create**.
* Install bundler gem using **gem install bundler**.
* Run **bundle install**.
* Update database.yml according to your db credentials.
* Create development db using **rake db:setup**.
* Create test db using **RAILS_ENV=test rake db:setup**.
* You should have phantomjs setup on your system this is required to run feature tests (using command **rspec ./spec**) but if you dont have you can run tests via selenium by using command **rspec ./spec -t visual**.
* Run server using **rails s**.
* If everything goes smooth you should be able to visit app at http://localhost:3000 in your browser.