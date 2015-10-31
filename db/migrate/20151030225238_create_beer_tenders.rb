class CreateBeerTenders < ActiveRecord::Migration
  def change
    create_table :beer_tenders do |t|
      t.string :device_id
      t.string :name
      t.string :avatar_url

      t.timestamps null: false
    end

    add_index :beer_tenders, :device_id, unique: true
  end
end
