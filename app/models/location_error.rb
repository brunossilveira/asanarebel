class LocationError
  attr_reader :message, :code

  def initialize(response)
    @message = response['error_message']
    @code = response.code
  end

  def success?
    false
  end
end
