class SessionsController < ApplicationController
  def new
    redirect_to root_path && return if current_user
    @user = User.new
  end

  def create
    if login(params[:email], params[:password])
      login_success
    else
      login_failure
    end
  end

  def destroy
    logout
    flash[:success] = LOGOUT_SUCCESS
    redirect_to root_path
  end

  private begin

    def login_success
      @user = current_user
      flash[:success] = "Welcome back, #{@user.name.capitalize}"
      redirect_to root_path
    end

    def login_failure
      flash[:error] = LOGIN_FAILED
      redirect_to login_path
    end

  end
end
