ruby '2.3.0'
source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', github: 'rails/rails'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'sass-rails'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', github: 'rails/turbolinks'
# Use Puma as the app server
gem 'puma'
# redis objects
gem 'connection_pool'
gem 'redis-objects'

# Background jobs
gem 'sidekiq'

# Redis namespace
gem 'redis-namespace'

# Localtime
gem 'local_time'

# Group records
gem 'groupdate'

# Caching
gem 'readthis'
gem 'hiredis' # Highly recommended
gem 'em-hiredis'
gem 'rack-cache'
gem 'redis-store'
gem 'redis-rack-cache'

# Autoprefixer
gem 'autoprefixer-rails'

gem 'bitly'

# Heroku
gem 'rails_12factor', group: :production

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'figaro'
  gem 'foreman'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
