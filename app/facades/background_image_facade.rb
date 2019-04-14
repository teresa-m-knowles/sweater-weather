class BackgroundImageFacade < LocationFacade
  def service
    BingImageService.new(@city_and_state)
  end

  def image_url
    service.image_url["value"][0]["contentUrl"]
  end
end
