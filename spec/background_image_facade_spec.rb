require 'rails_helper'

RSpec.describe BackgroundImageFacade do
  context 'Background image class' do
    before :each do
      @image = BackgroundImageFacade.new('denver,co')
    end
    it 'initiates a BingImageService' do
      expect(@image.service).to be_a(BingImageService)
    end

    it 'gets an image_url for its location' do
      expect(@image.image_url).to start_with("http")
    end
  end
end
