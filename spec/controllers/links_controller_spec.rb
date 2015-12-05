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

  it "raises an error when an inactive link is visited" do
    test_link = Link.new(full_url: urls[1], short_url: vanity, active: false)
    test_link.save
    get "/#{vanity}"
    expect(flash[:error]).to eql(
      "Link disabled by Creator"
    )
    test_link.destroy
  end

  it "raises an error when a deleted link is visited" do
    test_link = Link.new(full_url: urls[1], short_url: vanity, deleted: true)
    test_link.save
    get "/#{vanity}"
    expect(flash[:error]).to eql(
      "Link deleted by Creator"
    )
    test_link.destroy
  end
end
