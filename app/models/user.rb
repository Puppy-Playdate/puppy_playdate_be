class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :uid, uniqueness:true
  validates_presence_of :password_digest

  has_secure_password

  has_many :dogs
  has_many :socials
end
