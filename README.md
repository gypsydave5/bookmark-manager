| [*Makers Academy*](http://www.makersacademy.com) | Week 6 |
| ------------------------------------------------ | ------ |

###Bookmark Manager
---------------------

####Overview

This week's task was to create a bookmark manager - a site to load and display
favourited links. This was our first experience with integration testing using
Capybara. We were also introduced to relational databases as users need to be
able to save information on their accounts and retrieving during later sessions.
We also had to take security into consideration and implement token
authentication and mechanisms for forgotten passwords.

####User experience

A user can sign up, sign in and post links which they can associate with tags.
Returning users can get email reminders if they forget their password and see
previously saved links.

Check out the app here: [Bookmark Manager](http://bookmark-mgr.herokuapp.com/)

####Technologies used

+ Production
  + Ruby
  + Sinatra
  + PostgreSQL
  + Data Mapper
  + bcrypt
  + rack flash
  + Mailgun
  + dotenv

+ Testing
  + RSpec
  + Capybara
  + Timecop
  + Database cleaner

####Testing

If you would like to see the tests run, first clone the repo:
```shell
$ git clone git@github.com:gypsydave5/bookmark-manager-1.git
```

Change into the directory
```shell
$ cd bookmark-manager
```

Run bundle to load the required gems
```shell
$ bundle install
```

Ensure that you have PostgreSQL intalled locally - please see the relevant
documentation to install it with your OS.

You will need to create a database locally:
```shell
$ psql
  =# CREATE DATABASE 'bookmark_manager_test';
```

Migrate the required tables:
```shell
rake auto_migrate
```

Run Rspec:
```shell
$ rspec
```
