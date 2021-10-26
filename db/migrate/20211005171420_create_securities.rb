class CreateSecurities < ActiveRecord::Migration[6.1]
  def change
    create_table :securities do |t|
      t.string :ticker

      t.timestamps
    end
    add_index :securities, :ticker,  unique: true

  end
end
