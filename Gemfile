source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Bootstrap
gem 'bootstrap-sass', '~> 3.3.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# for nice icons
gem 'font-awesome-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use it to fix events
gem 'jquery-turbolinks'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use BBCode for parsing
gem 'bbcode-rails'

# Devise for user authentication
gem 'devise'

# Use seed-fu for idempotent seeding
gem 'seed-fu', '~> 2.3'

# We want pagination!
gem 'will_paginate', '~> 3.0.6'
gem 'will_paginate-bootstrap', '~> 1.0.1'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Pundit for Authorization
gem 'pundit', '~> 0.3.0'

# Use Paranoia so we don't lose data
gem 'paranoia', '~> 2.0'

# Use paperclip for attachments
gem 'paperclip', '~> 4.2'

# Use Capistrano for deployment
group :development do
  gem 'thin'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  gem 'capistrano3-puma'
  gem 'capistrano-postgresql'
  gem 'quiet_assets' # Turns off the Rails asset pipeline log
  gem 'bullet' # help reduce sql query speeds
  gem 'lol_dba' # helps scan for better indexing
end

group :production do
  gem 'puma' # Use puma as the app server
end

group :test do
  gem 'sqlite3'
end
