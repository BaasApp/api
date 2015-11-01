class User < ActiveRecord::Base
  has_many :updates, class_name: "User::Update"

  def self.json_collection
    order("created_at DESC").map(&:json_data)
  end

  def json_data
    {
      id: id,
      name: name,
      updates: updates.json_collection.map(&:json_data),
    }
  end

  def last_update
    last_update = updates.json_collection.first

    return {} unless last_update

    last_update.json_data
  end

  def health_auth!(email, password)
    data = Health.auth(email, password)
    self.health_email = email
    self.health_password = password
    self.health_access_token = data["access_token"]
    self.health_refresh_token = data["refresh_token"]
    self.health_token_type = data["token_type"]
    self.health_user_id = data["userID"]
    self.save!
  end

  def update_health!
    return unless health_access_token

    tries ||= 1

    self.calories = health_client.calories
    self.save!
  rescue RestClient::Forbidden => e
    health_auth!(health_email, health_password)

    if tries == 1
      tries -= 1
      retry
    else
      raise e
    end
  end

  private

  def health_client
    Health.new(self)
  end
end
