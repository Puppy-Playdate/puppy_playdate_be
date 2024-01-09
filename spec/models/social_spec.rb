require 'rails_helper'

RSpec.describe Social, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:event_date) }
    it { should validate_presence_of(:event_type) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'enum' do
    it { should define_enum_for(:event_type).with_values(chill: 0, playdate: 1, walk: 2) }
  end
end