class User < ApplicationRecord
  VALID_EMAIL_REGEX = /[[:alnum:]\.]+@[[:alnum:]]+\.[a-z]{3}/
  validates(:name, presence: true)
  validates :email, presence: true, length: {maximum: 100}, format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  validates :password, presence: true, length: { minimum: 6 }
  before_save {email.downcase!}

  has_secure_password
end
