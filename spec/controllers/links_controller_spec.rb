require "rails_helper"

describe LinksController, type: :request do
  include_context "shared stuff"

  def create_user_and_login
    post "/users", user: {
      name: valid_name, email: valid_email, password: valid_password
    }
    post "/sessions", user: {
      email: valid_email, password: valid_password
    }
  end

  def create_link
    post "/links", link: { full_url: urls[0], short_url: vanity }
  end

  def create_link_and_logout
    create_link
    delete "/logout"
  end

  def create_hacker_and_login
    post "/users", user: {
      name: valid_name, email: hacker_email, password: hacker_pass
    }
    post "/sessions", user: {
      email: hacker_email, password: hacker_pass
    }
  end

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

  it "detects when a link-delete action is initiated "\
  "by a user who's not the creator" do
    create_user_and_login
    create_link_and_logout

    create_hacker_and_login
    delete "/links/1"
    expect(flash[:error]).to eql(no_delete_permission)
  end

  it "detects when a link-edit action is initiated "\
  "by a user who's not the creator" do
    create_user_and_login
    create_link_and_logout

    create_hacker_and_login
    get "/links/1/edit"
    expect(flash[:error]).to eql(no_edit_permission)
  end

  it "detects when a link-update action is initiated "\
  "by a user who's not the creator" do
    create_user_and_login
    create_link_and_logout

    create_hacker_and_login
    patch "/links/1"
    expect(flash[:error]).to eql(no_edit_permission)
  end
end
