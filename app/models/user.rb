class User < ApplicationRecord
  has_secure_password

  attr_accessor :jwt

  enum role: {user: 0, admin: 1}

  has_many :glasses
  has_many :shopping_baskets

  before_save :email_to_lowercase
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  protected
  def email_to_lowercase
    self.email = email.downcase
  end
end
