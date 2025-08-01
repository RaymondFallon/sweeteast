# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.8'

gem 'bootsnap', require: false
gem 'devise'
gem 'font-awesome-rails'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg'
gem 'puma'
gem 'rails', '~> 7.1.0'
gem 'redis', '~> 4.0'
gem 'slim-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# gem "sassc-rails"
gem 'image_processing', '~> 1.2'
gem 'skylight'

group :development, :test do
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 6.1.0'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rake'
  gem 'rubocop-rspec'
  gem 'simplecov'
end

group :development do
  gem 'web-console'
  # gem "rack-mini-profiler"
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'sqlite3', '~>1.4'
end
