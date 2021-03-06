source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
gem 'active_model_serializers', '~> 0.10.4'
gem 'cancancan', '~> 3.2.1'
gem 'devise', '~> 4.2'
gem 'devise-jwt', '~>0.8.1'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'

  # rubocop
  gem 'rubocop', '~> 1.14'
  gem 'rubocop-performance', '~> 1.11', '>= 1.11.3'
  gem 'rubocop-rails', '~> 2.10', '>= 2.10.1'
  gem 'rubocop-rspec', '~> 2.3'

  gem 'fasterer', '~> 0.9.0'
  gem 'groupify'
  gem 'overcommit', '~> 0.57.0'
  gem 'rswag-specs'

  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.18'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'annotate'
  gem 'spring'
end
group :test do
  gem 'rspec_junit_formatter', '~> 0.2.3'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'simplecov', require: false
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
