module Gobble
  module Shortener
    module Test
      shared_context "shared stuff" do
        let(:urls) do
          [
            "https://docs.google.com/document/d/1V1YFusbUsG8rBd"\
            "-XcS9gc31xI45s4DMQIrheMIeRqb8/edit",
            "http://static.springsource.com/projects/tc-server/6.0/"\
            "getstart/rgsindexhtml.html",
          ]
        end
        let(:valid_name) { "testmaster" }
        let(:valid_email) { "testmaster@test.com" }
        let(:valid_password) { "testmaster" }
        let(:max) { 40 }
        let(:invalid_email) { "www gmail com" }
        let(:invalid_name) { "T" }
        let(:invalid_password) { "take" }

        before(:all) do
          DatabaseCleaner.strategy = :truncation
        end

        after(:all) do
          DatabaseCleaner.clean
          Capybara.reset_sessions!
          Capybara.use_default_driver
        end
      end

      def signup_helper
        fill_in "Name", with: valid_name
        fill_in "Email", with: valid_email
        fill_in "Password", with: valid_password

        click_button "Register"
      end

      def login_helper
        fill_in "Email", with: valid_email
        fill_in "Password", with: valid_password

        click_button "Log In"
      end
    end
  end
end
