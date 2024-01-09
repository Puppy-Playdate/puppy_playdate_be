require 'rails_helper'

RSpec.describe Dog, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:breed) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:size) }
    it { should validate_numericality_of(:age).only_integer }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'enum' do
    it { should define_enum_for(:size).with_values(small: 0, medium: 1, large: 2) }
  end
end