class UsersController < ApplicationController
  include UsersHelper
  include LinksHelper
  include ConstantsHelper

  before_action :require_login, only: [:home, :security]
  before_action :new_link, only: [:home, :security]
  before_action :get_current_user, only: [:home, :security]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      user_save_success
    else
      user_save_failure
    end
  end

  def home
    @links = @user.get_links.decorate
  end

  def security
    @api_key = @user.api_key
  end

  private

    def user_save_success
      login params[:user][:email], params[:user][:password]
      flash[:success] = "Welcome, #{@user.name.capitalize}"
      redirect_to home_path
    end

    def user_save_failure
      flash[:error] = @user.get_error
      redirect_to signup_path
    end

    def new_link
      @link = Link.new
    end

    def get_current_user
      @user = current_user
    end
end
