require "rails_helper"

describe LinksController, type: :request do
  include_context "shared stuff"

  it "raises an error when anonymous user passes in short link" do
    post links_path, link: {
      full_url: urls[1], short_url: vanity
    }
    expect(flash[:error]).to eql(
      "Permission not granted."
    )
  end
end
