class RootController < ApplicationController
  def index
    @link = Link.new
  end
end
