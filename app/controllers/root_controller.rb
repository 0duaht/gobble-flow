class RootController < ApplicationController
  def index
    @link = Link.new
    @popular = Link.most_popular
  end
end
