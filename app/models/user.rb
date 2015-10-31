class User < ActiveRecord::Base
  has_many :updates, class_name: "User::Update"

  def self.json_collection
    order("created_at DESC").map(&:json_data)
  end

  def json_data
    {
      id: id,
      name: name,
      updates: updates.all.json_collection,
    }
  end
end
