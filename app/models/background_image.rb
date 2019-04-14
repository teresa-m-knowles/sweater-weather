class BackgroundImage < Location
  def service
    BingImageService.new(@city_and_state)
  end

  def image_url
    image = service.image_url
    JSON.parse(image.body)["value"][0]["contentUrl"]
  end
end
