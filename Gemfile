source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'puma', '~> 3.0'
gem 'bcrypt', '~> 3.1.7'
gem 'coveralls', require: false
gem 'active_model_serializers'
gem 'jwt'
gem 'figaro'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :test do
  gem 'database_cleaner'
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :production do
  gem 'pg'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
