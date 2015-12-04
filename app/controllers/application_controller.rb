class ApplicationController < ActionController::Base
  include ConstantsHelper
  protect_from_forgery with: :exception
end
