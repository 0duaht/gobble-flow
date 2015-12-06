class User < ActiveRecord::Base
  include ConstantsHelper

  has_many :links
  authenticates_with_sorcery!

  scope :top, lambda {
    order("link_count desc").limit(5).select("name", "link_count")
  }

  validates :name, length: {
    minimum: 2,
    message: "too short. Minimum length is two characters"
  }

  validates :password, length: {
    minimum: 5,
    message: "too short. Minimum length is five characters"
  }, if: :new_record?

  validates :email, uniqueness: true, email_format: {
    message: "invalid. Please use a different one"
  }

  before_create :gen_api_key

  def gen_api_key
    self.api_key = SecureRandom.urlsafe_base64(48)
  end

  def get_error
    return_error = ERROR
    err_messages = errors.messages
    if err_messages
      error_column = err_messages.first[0].to_s.capitalize
      error_cause = err_messages.first[1][0].to_s
      return_error = "#{error_column} #{error_cause}"
    end
    return_error
  end

  def get_links
    self.links.where(deleted: false).order("created_at desc")
  end
end
