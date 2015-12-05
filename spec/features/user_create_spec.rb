require "rails_helper"

describe "Link-Creation for Logged-In Users" do
  include_context "shared stuff"

  context "when logged in user visits root path" do
    it "they see form for creating links with short url entry", js: true do
      visit signup_path
      signup_helper

      expect(page).to have_content("Full URL")
      expect(page).to have_content("Custom URL")
      expect(page).to have_button("Gobble")
    end
  end

  context "when logged-in user tries to create a link" do
    it "shortens urls by logged-in users", js: true do
      visit login_path
      login_helper
      fill_in "Full URL", with: urls[0]
      fill_in "Custom URL", with: vanity
      click_button "Gobble"

      expect(page).to have_css(
        ".url-box",
        text: "Link generated successfully"
      )
      expect(page).to have_css(
        ".url-box",
        text: "/#{vanity}"
      )
    end

    it "raises error when url has been chosen", js: true do
      visit login_path
      login_helper
      fill_in "Full URL", with: urls[1]
      fill_in "Custom URL", with: vanity
      click_button "Gobble"

      expect(page).to have_css(
        "#toast-container",
        text: "URL already taken"
      )
    end

    it "raises error when url is an internal path", js: true do
      visit login_path
      login_helper
      fill_in "Full URL", with: urls[1]
      fill_in "Custom URL", with: reserved_word
      click_button "Gobble"

      expect(page).to have_css(
        "#toast-container",
        text: "Path reserved."
      )
    end
  end
end
