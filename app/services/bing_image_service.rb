class BingImageService

  def initialize(city_and_state)
    @city_and_state = city_and_state
  end

  def connection
    Faraday.new(url:'https://api.cognitive.microsoft.com/bing/v7.0/images/search') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def image_url
    connection.get do |req|
      req.url "?q=#{@city_and_state}&safeSearch=Strict"
      req.headers['Ocp-Apim-Subscription-Key'] = ENV['BING_KEY']
    end
  end


end
