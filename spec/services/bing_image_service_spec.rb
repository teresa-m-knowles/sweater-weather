require 'rails_helper'

RSpec.describe 'BingImageService' do
  before :each do
    @service = BingImageService.new('denver,co')
  end

  it 'exists' do
    expect(@service).to be_a(BingImageService)
  end

  it 'can get the image url' do
    image = @service.image_url

    expect(image["value"][0]).to have_key("contentUrl")
  end

end
