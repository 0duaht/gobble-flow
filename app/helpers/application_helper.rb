module ApplicationHelper
  def signup_link
    return if current_user || current_page?(signup_path)
    content_tag(:li, (link_to "Sign Up", signup_path))
  end

  def login_link
    return if current_user || current_page?(login_path)
    content_tag(:li, (link_to "Log In", login_path))
  end

  def logout_link
    return unless current_user
    content_tag(:li, (link_to "Log Out", logout_path, method: "delete"))
  end

  def short_url_entry(form_obj)
    return unless current_user
    render partial: "custom_url", object: form_obj, as: "f"
  end

  def show_toast_message
    if flash[:success] && !flash[:url]
      render partial: "toast_message", object: flash[:success], as: "message"
    elsif flash[:error]
      render partial: "toast_message", object: flash[:error], as: "message"
    end
  end
end
