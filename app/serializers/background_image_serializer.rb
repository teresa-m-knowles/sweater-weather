class BackgroundImageSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :image_url
end
