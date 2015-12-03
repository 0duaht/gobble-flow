class User < ActiveRecord::Base
  has_many :links
  authenticates_with_sorcery!
end
