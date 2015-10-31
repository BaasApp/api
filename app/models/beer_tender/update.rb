class BeerTender::Update < ActiveRecord::Base
  belongs_to :beer_tender

  def data
    {
      beer_tender_id: beer_tender_id,
      update_id: id,
      recorded_at: recorded_at,
      latitude: latitude,
      longitude: longitude,
      temperature: temperature,
      battery_percentage: battery_percentage,
    }
  end

  def recorded_at
    uplink["Time"]
  end

  def latitude
    generated['DeviceLAT']
  end

  def longitude
    generated['DeviceLON']
  end

  def temperature
    generated['DeviceTempCelsius']
  end

  def battery_percentage
    generated['DeviceBatteryPercentage']
  end

  private

  def content
    payload["content"]
  end

  def uplink
    content["DevEUI_uplink"]
  end

  def generated
    content["generated"]
  end
end
