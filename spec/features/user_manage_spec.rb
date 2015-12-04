require "rails_helper"

RSpec.configure do |c|
  c.include Gobble::Shortener::Test
end

describe "User Registration" do
  include_context "shared stuff"

  context "when user visits the registration page" do
    it "the page should display a registration form" do
      visit signup_path

      expect(page).to have_content("Registration")
      expect(page).to have_selector("form")
      expect(page).to have_content("Name")
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      find("button", text: "Register")
    end

    it "signup is successful when all "\
      "values are entered correctly", js: true do
      visit signup_path
      signup_helper

      expect(page).to have_css("#toast-container",
        text: "Welcome, #{valid_name.capitalize}")
      expect(page).to have_link("Log Out")
    end
  end

  context "when user visits the login page" do
    it "the page should display a login form" do
      visit login_path

      expect(page).to have_content("Log In")
      expect(page).to have_selector("form")
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      find("button", text: "Log In")
    end

    it "login is successful when all values are entered correctly", js: true do
      visit login_path
      login_helper

      expect(page).to have_css(
        "#toast-container",
        text: "Welcome back, #{valid_name.capitalize}"
      )
      expect(page).to have_link("Log Out")
    end

    it "when user retries logging in while logged in,"\
      " it redirects to root page" do
      visit login_path
      login_helper

      visit login_path
      expect(page).to have_current_path(login_path)
    end
  end

  context "when user visits logout path" do
    it "it logs user out", js: true do
      visit login_path
      login_helper

      click_link "Log Out"
      expect(page).to have_css(
        "#toast-container",
        text: "Successfully logged out"
      )
    end
  end
end
