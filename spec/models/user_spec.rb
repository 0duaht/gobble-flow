require "rails_helper"

RSpec.configure do |c|
  c.include Gobble::Shortener::Test
end

describe User, type: :model do
  include_context "shared stuff"

  let(:name) { "Tobi" }
  let(:email) { "oduaht@gmail.com" }
  let(:password) { "andela" }
  let(:new_user) { User.new(name: name, email: email, password: password) }

  it "creates a new user when passed in correct details" do
    new_user.save
    expect(new_user).to be_valid
  end

  it "responds to instance methods" do
    new_user.save
    expect(new_user).to respond_to(:name)
    expect(new_user).to respond_to(:email)
    expect(new_user).to respond_to(:password)
    expect(new_user).to respond_to(:api_key)
    expect(new_user).to respond_to(:link_count)
    expect(new_user.get_links.length).to eql(0)
  end
end
