# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

group :security do
  gem 'bcrypt'
end

group :development do
  gem 'pg'
  gem 'sinatra'
  gem 'sinatra-flash'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'rspec'
  gem 'rubocop', '0.79.0'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
