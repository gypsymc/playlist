class User < ApplicationRecord
  has_secure_password
  has_many :songs
  has_many :playlists, through: :songs

  # email regex and letter regex
  LETTER_REGEX = /\A^[A-Za-z]+$\z/
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :email, :password, presence: true
  validates :first_name, :last_name, uniqueness: { case_sensitive: false }, format: { with: LETTER_REGEX }, length: { in: 2..50 }
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: { in: 8..20 }

  before_save do
  	self.first_name.capitalize!
  	self.last_name.capitalize!
  	self.email.downcase!
  end
end
