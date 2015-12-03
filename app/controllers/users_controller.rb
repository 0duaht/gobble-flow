class UsersController < ApplicationController
  include UsersHelper

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

  private

    def user_save_success
      login params[:user][:email], params[:user][:password]
      flash[:success] = "Welcome, #{@user.name.capitalize}"
      redirect_to root_path
    end

    def user_save_failure
      flash[:error] = @user.get_error
      redirect_to signup_path
    end
end
