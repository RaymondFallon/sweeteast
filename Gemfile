source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.5"

gem 'devise'
gem "rails", "~> 7.1.0"
gem "font-awesome-rails"
gem "sprockets-rails"
gem "pg"
gem "puma"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem 'slim-rails'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
# gem "sassc-rails"
gem "image_processing", "~> 1.2"
gem 'skylight'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 6.1.0'
  gem 'simplecov'
end

group :development do
  gem "web-console"
  # gem "rack-mini-profiler"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem 'sqlite3'
end
