module ApplicationHelper
  def safe_t(*translation_keys)
    (t *translation_keys).html_safe
  end
end
