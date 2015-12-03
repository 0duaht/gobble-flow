require "rails_helper"

RSpec.configure do |c|
  c.include Gobble::Shortener::Test
end

describe UsersController, type: :request do
  include_context "shared stuff"

  let(:invalid_email) { "www gmail com" }
  let(:invalid_name) { "T" }
  let(:invalid_password) { "take" }

  it "raises an error when email is invalid" do
    post "/users", user: {
      name: invalid_name, email: email, password: password
    }
    expect(flash[:error]).to eql(
      "Name too short. Minimum length is two characters"
    )
  end

  it "raises an error when password is invalid" do
    post "/users", user: {
      name: name, email: email, password: invalid_password
    }
    expect(flash[:error]).to eql(
      "Password too short. Minimum length is five characters"
    )
  end

  it "raises an error when email is invalid" do
    post "/users", user: {
      name: name, email: invalid_email, password: password
    }
    expect(flash[:error]).to eql(
      "Email invalid. Please use a different one"
    )
  end
end
