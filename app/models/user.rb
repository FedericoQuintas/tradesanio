class User < ApplicationRecord
    has_many :watchlists
    validates :pass, presence: true
    validates :email, presence: true
end
