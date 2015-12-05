require "rails_helper"

describe SessionsController, type: :request do
  include_context "shared stuff"

  it "renders the right view for logging in" do
    get login_path
    expect(response).to render_template("new")
  end

  it "raises an error when email is invalid" do
    post sessions_path, user: {
      email: invalid_email, password: valid_password
    }
    expect(flash[:error]).to eql(
      "Login failed. User details incorrect!"
    )
  end

  it "raises an error when password is invalid" do
    post sessions_path, user: {
      email: valid_email, password: invalid_password
    }
    expect(flash[:error]).to eql(
      "Login failed. User details incorrect!"
    )
  end
end
