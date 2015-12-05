class UserDecorator < Draper::Decorator
  delegate_all

  def link_count_string
    link_count.to_s << (link_count == 1 ? " link" : " links")
  end
end
