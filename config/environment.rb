# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Codemocracy::Application.initialize!

Haml::Template.options = {
  :format => :xhtml, 
  :escape_html => true,
  :attr_wrapper => '"',
  :autoclose => %w(meta img link br hr input area param col base),
  :preserve => %w(textarea pre)
} 