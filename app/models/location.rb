class Location
  attr_reader :latitude, :longitude

  def initialize(response)
    location = response["results"].first&.dig("geometry", "location")

    @latitude = location&.dig("lat")
    @longitude = location&.dig("lng")
  end

  def success?
    true
  end
end
