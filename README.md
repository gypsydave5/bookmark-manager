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
  + bcrypt
  + CSS
  + Data Mapper
  + dotenv
  + ERB
  + HTML
  + Mailgun
  + PostgreSQL
  + rack flash
  + Ruby
  + Sinatra

+ Testing
  + Capybara
  + Database cleaner
  + RSpec
  + Timecop

####Testing

If you would like to see the tests run, first clone the repo:
```shell
$ git clone git@github.com:gypsydave5/bookmark-manager.git
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

#### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[Haml]: http://haml.info/
[Yo]: http://www.justyo.co/
[Bookmark Manager]: https://github.com/gypsydave5/bookmark-manager
[Cucumber]: http://cukes.info/
[Timecop]: https://github.com/travisjeffery/timecop
[bcrypt]: https://github.com/codahale/bcrypt-ruby
[CSS]: https://developer.mozilla.org/en-US/docs/Web/CSS
[Data Mapper]: http://datamapper.org/
[dotenv]: https://github.com/bkeepers/dotenv
[ERB]: http://www.stuartellis.eu/articles/erb/#other-resources
[HTML]: https://developer.mozilla.org/en-US/docs/Web/HTML
[Mailgun]: https://github.com/bkeepers/dotenv
[PostgreSQL]: http://www.postgresql.org/
[rack flash]: https://github.com/nakajima/rack-flash
[Ruby]: https://www.ruby-lang.org/en/
[Sinatra]: http://www.sinatrarb.com/
[Capybara]: http://jnicklas.github.io/capybara/
[Database cleaner]: https://github.com/DatabaseCleaner/database_cleaner
[RSpec]: http://rspec.info/
