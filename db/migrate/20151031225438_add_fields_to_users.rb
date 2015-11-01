class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :beer_count, :integer, default: 0
    add_column :users, :wallet_amount, :integer, default: 0
    add_column :users, :calories, :integer, default: 0
  end
end
