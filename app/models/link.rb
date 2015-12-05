class Link < ActiveRecord::Base
  belongs_to :user

  scope :most_popular, lambda {
    where(deleted: false).order("count desc").
      limit(5).select("full_url", "short_url", "count")
  }

  scope :most_recent, lambda {
    where(deleted: false).order("created_at desc").
      limit(5).select("full_url", "short_url", "created_at")
  }

  validates :full_url, url: true, presence: true
  before_create :gen_short_url, :check_protocol

  def gen_short_url
    if self.short_url.nil? || self.short_url.eql?("")
      self.short_url = SecureRandom.urlsafe_base64(5)
    end
  end

  def check_protocol
    unless self.full_url.start_with?("http")
      self.full_url = "http://" + self.full_url
    end
  end
end
