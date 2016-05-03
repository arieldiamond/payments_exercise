source 'https://rubygems.org'

gem 'rails', '4.2.4'
gem 'sqlite3'
gem 'jbuilder', '~> 2.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# API
gem 'grape'
gem 'hashie-forbidden_attributes'
gem 'grape-active_model_serializers'
gem 'rack-cors', :require => 'rack/cors'

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'awesome_print'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec-rails'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'guard-rspec'
  gem 'pry'
end
