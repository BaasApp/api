class CreateUserUpdates < ActiveRecord::Migration
  def change
    create_table :user_updates do |t|
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
