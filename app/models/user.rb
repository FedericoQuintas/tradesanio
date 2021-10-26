require 'bcrypt'
class User < ApplicationRecord
  attr_accessor :password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :watchlists
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
