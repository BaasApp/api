class User::Update < ActiveRecord::Base
  belongs_to :user

  def self.json_collection
    where('created_at > ?', 30.minutes.ago).order("created_at DESC").limit(10)
  end

  def json_data
    {
      id: id,
      latitude: latitude,
      longitude: longitude,
      created_at: created_at,
    }
  end
end
