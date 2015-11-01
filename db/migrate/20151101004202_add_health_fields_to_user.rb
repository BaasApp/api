class AddHealthFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :health_access_token, :string
    add_column :users, :health_refresh_token, :string
    add_column :users, :health_token_type, :string
    add_column :users, :health_user_id, :string
  end
end
