require "rails_helper"

describe UsersController, type: :request do
  include_context "shared stuff"

  it "renders the right view for signing up" do
    get signup_path
    expect(response).to render_template("new")
  end

  it "raises an error when email is invalid" do
    post users_path, user: {
      name: invalid_name, email: valid_email, password: valid_password
    }
    expect(flash[:error]).to eql(
      "Name too short. Minimum length is two characters"
    )
  end

  it "raises an error when password is invalid" do
    post users_path, user: {
      name: valid_name, email: valid_email, password: invalid_password
    }
    expect(flash[:error]).to eql(
      "Password too short. Minimum length is five characters"
    )
  end

  it "raises an error when email is invalid" do
    post users_path, user: {
      name: valid_name, email: invalid_email, password: valid_password
    }
    expect(flash[:error]).to eql(
      "Email invalid. Please use a different one"
    )
  end

  it "signs up successfully when all details are correct" do
    post users_path, user: {
      name: valid_name, email: valid_email, password: valid_password
    }
    expect(flash[:success]).to eql(
      "Welcome, #{valid_name.capitalize}"
    )
  end
end
