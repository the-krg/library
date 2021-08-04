![the old library](./app/assets/images/library-horizontal.jpg "the old library")

The old library is a system that register book rentals, and displays who booked it, and when it should be returned.


## System specs:
* Ruby version: `3.0.0`
* Rails version: `6.1.3`
* System dependencies:
  - postgresql
  
* Configuration
  1. `$ git clone git@github.com:the-krg/library.git`
  2. `$ cd library`
  3. `$ bundle install`
  4. `$ rails db:create db:migrate db:seed`
  5. `$ rails s`
  6. Go to `localhost:3000`
  7. Done!

* How to run the test suite: `bundle exec rspec`

* Deployment instructions: Merges on `main` branch will be automatically deployed
