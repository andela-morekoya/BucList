source "https://rubygems.org"


gem "rails", "~> 5.0.0", ">= 5.0.0.1"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "bcrypt", "~> 3.1.7"
gem "jquery-rails"
gem "coveralls"
gem "doorkeeper"
gem "doorkeeper-jwt"
gem "active_model_serializers"

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem "turbolinks", "~> 5"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem "jbuilder", "~> 2.5"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 3.0"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

group :development, :test do
  gem "byebug", platform: :mri
  gem "rspec-rails"
  gem "sqlite3"
end

group :test do
  gem "rspec-rails"
  gem "database_cleaner"
  gem "faker"
  gem "factory_girl_rails"
  gem "shoulda-matchers", '~> 3.1'
  # gem "json_matchers"
end

group :development do
  gem "web-console"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "pg"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
