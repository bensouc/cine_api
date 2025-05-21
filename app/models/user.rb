class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  has_secure_password
end
