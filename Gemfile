source 'http://rubygems.org'

# Rails 3.0.0.rc depends on bundler 1.0.0.rc.1, which is not available on Heroku as of 2010-07-27
gem 'rails', '3.0.0.beta4'

# Heroku needs to be loaded for `rake heroku:config` to run, but it causes json_pure to be loaded twice.
# Uncomment this line if you need to run `rake heroku:config`.
# gem 'heroku'

gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'haml'
gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3'

group :development, :test do
  gem "rspec-rails", ">= 2.0.0.beta.17"
end

group :development do
  gem 'rails3-generators'
end

group :test do
  gem 'factory_girl_rails'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri', '1.4.1'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for certain environments:
# gem 'rspec', :group => :test
# group :test do
#   gem 'webrat'
# end
