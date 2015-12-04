module ApplicationHelper
  def signup_link
    unless current_page?(signup_path)
      content_tag(:li, (link_to 'Sign Up', signup_path))
    end 
  end
end
