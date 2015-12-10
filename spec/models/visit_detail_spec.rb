require "rails_helper"

describe VisitDetail, type: :model do
  let(:ip_address) { "127.0.0.1" }
  let(:referer) { "http://medium.com" }
  let(:browser_details) { "Chrome 42.2" }
  let(:visit_detail) do
    VisitDetail.create(
      ip_address: ip_address,
      referer: referer,
      browser_details: browser_details
    )
  end

  let(:visit_detail_no_ref) do
    VisitDetail.create(
      ip_address: ip_address,
      browser_details: browser_details
    )
  end

  it "creates a new visit-detail when passed in correct details" do
    expect(visit_detail).to be_valid
    expect(visit_detail_no_ref).to be_valid
  end

  it "prints out referer when referer is not nil" do
    expect(visit_detail.decorate.referer_string).to eql(referer)
  end

  it "prints out blank referer when referer is nil" do
    expect(visit_detail_no_ref.decorate.referer_string).to eql("Referer Blank.")
  end
end
