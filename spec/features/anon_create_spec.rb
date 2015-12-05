require "rails_helper"

describe "Link-Creation for Anonymous Users" do
  include_context "shared stuff"

  context "when anonymous user visits root path" do
    it "they see form for creating links without short url entry" do
      visit root_path
      expect(page).to have_content("Full URL")
      expect(page).to have_no_content("Custom URL")
      expect(page).to have_button("Gobble")
    end

    it "displays sections for popular links" do
      visit root_path

      expect(page).to have_content("Popular Links")
    end
  end

  context "when anonymous user tries to create a link" do
    it "raises error when link is invalid", js: true do
      visit root_path
      fill_in "Full URL", with: invalid_url
      click_button "Gobble"

      expect(page).to have_css(
        "#toast-container",
        text: "Invalid Entry"
      )
    end

    it "shortens urls by anonymous users", js: true do
      visit root_path
      fill_in "Full URL", with: urls[0]
      click_button "Gobble"

      expect(page).to have_css(
        ".url-box",
        text: "Link generated successfully"
      )
    end
  end
end
