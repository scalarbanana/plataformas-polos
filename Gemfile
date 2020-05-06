# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'rails-i18n', '~> 6.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# HTML Abstraction Markup Language - A Markup Haiku
gem 'haml', '~> 5.1'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Mongoid is an ODM (Object Document Mapper) Framework for MongoDB
gem 'mongoid', '~> 7.1'
# A Mongoid Extension that simplifies the use of MongoDB spatial features.
gem 'mongoid-geospatial', '~> 5.1'
# Complete Ruby geocoding solution.
gem 'geocoder', '~> 1.6'
# Ruby gem for phone validation and formatting using google libphonenumber library data
gem 'phonelib', '~> 0.6.43'
# Enumerated attributes with I18n and ActiveRecord/Mongoid support
gem 'enumerize', '~> 2.3.1'
# Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup
gem 'simple_form', '~> 5.0'
# Devise is a flexible authentication solution for Rails based on Warden
gem 'devise', '~> 4.7'
gem 'devise-i18n', '~> 1.9'
# Minimal authorization through OO design and pure Ruby classes
gem 'pundit', '~> 2.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'i18n-debug', '~> 1.2'
  gem 'rails_best_practices', '~> 1.20', require: false
  gem 'reek', '~> 6.0', require: false
  gem 'rubocop', '~> 0.81.0', require: false
  gem 'rubocop-rails', '~> 2.5', require: false
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :test do
  # Simple one-liner tests for common Rails functionality
  gem 'shoulda-matchers', '~> 4.3'
  # SimpleCov is a code coverage analysis tool for Ruby
  gem 'simplecov', '~> 0.18.5'
  # A library for generating fake data such as names, addresses, and phone numbers.
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
  # rspec-rails is a testing framework for Rails 5+.
  gem 'rspec-rails', '~> 4.0'
  # Acceptance test framework for web applications
  gem 'capybara', '~> 3.32'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
