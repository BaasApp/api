class Lora
  def initialize(id)
    @id = id
  end

  def data
    @data ||=
      begin
        data = RestClient.get(rest_url, { accept: :json })
        JSON.parse(data)
      end
  end

  private

  def rest_url
    @rest_url ||= "http://hackathon:Hackathon2015@145.128.2.100:8042/v1/search?options=all&format=json&pageLength=10&collection=KPNlora&q=#{@id}%20results:raw%20sort:time"
  end
end
