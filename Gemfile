source 'https://rubygems.org'

ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use PostgreSQL as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Added knock gem for JWT authentication
gem 'knock'
# CarrierWave for image uploading
gem 'carrierwave'
# CarrierWave base64 for API image uploading
gem 'carrierwave-base64'
# MiniMagick for image processing
gem 'mini_magick'
# ActiveModel Serializers for model serialization
gem 'active_model_serializers'
# HTTParty for API interaction
gem 'httparty'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  # Rails 12Factor for Heroku deployment
  gem 'rails_12factor'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # RSpec for BDD
  gem 'rspec-rails'
  # FactoryGirl for model factories
  gem 'factory_girl_rails'
  # Faker for factory data
  gem 'faker'
end

group :test do
  # ShouldMatchers for easier specs
  gem 'shoulda-matchers'
  # DatabaseCleaner for cleaning the databse between test runs
  gem 'database_cleaner'
  # Fuubar for spec progress bar
  gem 'fuubar'
  # Webmock to disallow web connectivity during spec runs
  gem 'webmock'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
