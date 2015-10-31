class BeerTender < ActiveRecord::Base
  has_many :updates, class_name: "BeerTender::Update", dependent: :destroy

  def self.load_updates
    BeerTender.all.each(&:load_updates)
  end

  def load_updates
    lora_results.each do |result|
      updates.
        create_with(payload: result[:payload]).
        find_or_create_by(uri: result[:uri])
    end
  end

  def index_json
    {
      id: id,
      name: name,
      avatar_url: avatar_url,
      last_update: last_update_json,
    }
  end

  def show_json
    {
      id: id,
      name: name,
      avatar_url: avatar_url,
      updates: updates_json,
    }
  end

  def updates_json
    ordered_updates.limit(10).map(&:data)
  end

  def last_update_json
    ordered_updates.first.data
  end

  private

  def ordered_updates
    updates.order("payload->'content'->'DevEUI_uplink'->>'Time' DESC")
  end

  def lora_results
    lora_data.map do |result|
      {
        uri: result["uri"],
        payload: result,
      }
    end
  end

  def lora_data
    Lora.new(device_id).data["results"]
  end
end
