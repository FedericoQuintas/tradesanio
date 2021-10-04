class CreateWatchlistSecurities < ActiveRecord::Migration[6.1]
  def change
    create_table :watchlist_securities do |t|
      t.references :watchList, null: false, foreign_key: true
      t.references :security, null: false, foreign_key: true

      t.timestamps
    end
  end
end
