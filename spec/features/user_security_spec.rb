require "rails_helper"

describe "User's Security Page" do
  include_context "shared stuff"

  context "security page for logged-in users" do
    it "signs up", js: true do
      visit signup_path
      signup_helper
    end

    it "displays user's api", js: true do
      visit login_path
      login_helper
      visit security_path
      expect(page).to have_content("Your personal public API Key is ")
    end
  end
end
