source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'gmaps4rails'
gem 'figaro'
gem 'geocoder'
gem "simple_calendar", "~> 2.0"
gem "paperclip", "~> 5.0.0"
gem 'simple_form'
gem 'aws-sdk', '~> 2.3'
gem 'fullcalendar-rails'
gem 'momentjs-rails'
gem 'twilio-ruby'
gem 'bootstrap-multiselect_rails', '~> 0.9.4'
gem 'newrelic_rpm'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'byebug'
  gem 'pry-rails'
  gem "faker"
end

group :test do
  gem 'webmock'
  gem 'simplecov'
  gem 'vcr'
  gem 'shoulda-matchers'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
