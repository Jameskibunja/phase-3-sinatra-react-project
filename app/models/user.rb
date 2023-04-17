class User < ActiveRecord::Base
  has_secure_password
  has_many :messages

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
