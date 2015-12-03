require "rails_helper"

describe Link, type: :model do
  let(:full_url) do
    "docs.google.com/document/d/1Re50hxx5jW54NkAl8"\
    "ir8Ekfc0PfTeWNeg-WsTFLNNaU/edit?ts=5649dd7a"
  end
  let(:short_url) { "checkpoint2" }
  let(:new_link) { Link.create(full_url: full_url) }
  let(:new_link_custom) do
    Link.create(
      full_url: full_url,
      short_url: short_url
    )
  end

  it "creates a new link when passed in correct details" do
    expect(new_link).to be_valid
    expect(new_link).to respond_to(:active)
    expect(new_link).to respond_to(:deleted)
    expect(new_link).to respond_to(:user_id)
    expect(new_link_custom).to be_valid
  end
end
