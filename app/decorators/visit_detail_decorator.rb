class VisitDetailDecorator < Draper::Decorator
  delegate_all

  def referer_string
    return "Referer Blank." if referer.nil?
    referer
  end
end
