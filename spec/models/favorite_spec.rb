require 'rails_helper'

RSpec.describe Favorite, type: :model do
  context 'validations' do
    describe 'belongs to a user and a location' do
      it { should belong_to(:user) }
      it { should belong_to(:location) }

    end
  end
end
