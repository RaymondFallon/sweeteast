# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Developing

1. `bundle`
2. `rails db:create db:migrate db:seed`
3. `./bin/dev`

If you prefer to not use Foreman/Overmind, you need to run the Rails server and CSS build in separate shells:

1. `rails s`
2. In a new terminal window: `yarn css:build --watch`
