Haml::Template.options = {
  :format => :xhtml, 
  :escape_html => true,
  :attr_wrapper => '"',
  :autoclose => %w(meta img link br hr input area param col base),
  :preserve => %w(textarea pre)
} 
