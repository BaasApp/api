class Health
  API_URL = "https://www.measuretomotivate.philips.com/api"

  def self.auth(email, password)
    auth_data = { username: email, password: password }

    result = RestClient.post("#{API_URL}/auth", auth_data, content_type: :json, accept: :json)
    JSON.parse(result)
  end

  def initialize(user)
    @user = user
  end

  def calories(start_date=nil)
    observations["entry"].first["content"]["valueQuantity"]["value"]
  end

  def observations(start_date=nil)
    tries ||= 1
    start_date ||= 8.hours.ago
    start_time = start_date.strftime("%FT%R")
    end_time = Date.today.strftime("%FT%R")

    url =  "#{API_URL}/fhir/Observation?patient.id=#{@user.health_user_id}"
    url << "&type=calories"
    url << "&start=#{start_time}"
    url << "&end=#{end_time}"

    result = RestClient.get(url, api_options)
    JSON.parse(result)
  end

  private

  def api_options
    {
      content_type: :json,
      accept: :json,
      "Authorization" => "bearer #{@user.health_access_token}",
    }
  end
end
