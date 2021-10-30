require 'securerandom'
class Token < ApplicationRecord
  belongs_to :user


  before_save :generate_token

  def generate_token
      self.token = SecureRandom.hex
  end
end
