class Watchlist < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :securities, join_table: 'watchlist_securities'
  validates :description, presence: true
end
