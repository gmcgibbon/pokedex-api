class User < ApplicationRecord

  EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/

  validates :email,
    presence: true,
    format: { with: EMAIL_REGEX, allow_blank: true }
  has_secure_password
  validates :first_name, presence: true
  validates :last_name,  presence: true
end
