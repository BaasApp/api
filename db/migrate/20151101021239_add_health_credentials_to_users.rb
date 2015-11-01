class AddHealthCredentialsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :health_email, :string
    add_column :users, :health_password, :string
  end
end
