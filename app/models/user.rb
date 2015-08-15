class User < ActiveRecord::Base

  validates :name, presence: true, length: { in: 3 - 50 }
  has_secure_password
end
