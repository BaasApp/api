class CreateBeerTenderUpdates < ActiveRecord::Migration
  def change
    create_table :beer_tender_updates do |t|
      t.references :beer_tender, index: true, foreign_key: true
      t.string :uri
      t.json :payload

      t.timestamps null: false
    end

    add_index :beer_tender_updates, :uri, unique: true
  end
end
