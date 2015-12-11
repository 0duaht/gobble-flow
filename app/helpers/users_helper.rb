module UsersHelper
  private

  def user_params
    params.require(:user).
      permit :email, :password, :name
  end
end
