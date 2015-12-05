class RootController < ApplicationController
  def index
    @link = Link.new
    @popular = Link.most_popular
    @recent = Link.most_recent
  end
end
