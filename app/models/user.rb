class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  # validates :password, presence: true
  # validates :password_confirmation, presence: true, on: :create
  validates :api_key, uniqueness: true

  def gen_api_key
    self.api_key = SecureRandom.urlsafe_base64
    self.save
  end
end
