# Load the rails application
require File.expand_path('../application', __FILE__)

# support yaml and heroku config vars, preferring ENV for heroku
# Read more at http://trevorturk.com/2009/06/25/config-vars-and-heroku/
# Heroku ENV is read in from config/config.yml with `rake heroku:config`
require 'yaml'
CONFIG = (YAML.load_file('config/config.yml')[Rails.env] rescue {}).merge(ENV)

# Initialize the rails application
Codemocracy::Application.initialize!
