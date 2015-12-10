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

  def home_link
    return unless current_user && !current_page?(home_path)
    content_tag(:li, (link_to "Dashboard", home_path))
  end

  def security_link
    return unless current_user && !current_page?(security_path)
    content_tag(:li, (link_to "Security", security_path))
  end

  def short_url_entry(form_obj)
    return unless current_user
    render partial: "application/shorten/custom_url", object: form_obj, as: "f"
  end

  def show_toast_message
    if flash[:success] && !flash[:url]
      render partial: "application/toast/toast_message",
             object: flash[:success],
             as: "message"
    elsif flash[:error]
      render partial: "application/toast/toast_error",
             object: flash[:error],
             as: "message"
    end
  end
end
