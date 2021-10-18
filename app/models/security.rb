class Security < ApplicationRecord
    has_and_belongs_to_many :watchlists, join_table: 'watchlist_securities'
    validates :ticker, presence: true
end
