class Geocoding
  include HTTParty
  format :json

  base_uri "https://maps.googleapis.com/maps/api"

  attr_reader :options

  def initialize(address)
    @options = {
      query: {
        address: address,
        key: ENV["GOOGLE_GEOCODE_API_KEY"]
      }
    }
  end

  def location
    response = self.class.get("/geocode/json", options)

    if response.success?
      Location.new(response)
    else
      LocationError.new(response)
    end
  end
end
