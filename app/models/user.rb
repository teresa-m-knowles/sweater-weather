class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :api_key
  validates_uniqueness_of :api_key

  has_many :favorites
  has_many :locations, through: :favorites


end
