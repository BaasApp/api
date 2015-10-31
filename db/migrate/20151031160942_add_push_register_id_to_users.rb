class AddPushRegisterIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :push_register_id, :string
  end
end
