require 'rails_helper'

describe User, type: :model do
  let(:name) { "Tobi" }
  let(:email) { "oduaht@gmail.com" }
  let(:password) { "andela" }
  let(:new_user) { User.new(name: name, email: email, password: password)}
  
  it "creates a new user when passed in correct details" do
    expect(new_user).to be_valid
  end
  
  it "responds to instance methods" do
    expect(new_user).to respond_to(:name)
    expect(new_user).to respond_to(:email)
    expect(new_user).to respond_to(:password)
    expect(new_user).to be_a User
  end
  
end
