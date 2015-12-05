class RootController < ApplicationController
  def index
    @link = Link.new
    @popular = Link.most_popular.decorate
    @recent = Link.most_recent.decorate
    @users = User.top.decorate
  end
end
