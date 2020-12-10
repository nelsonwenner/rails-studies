require 'rails_helper'

RSpec.describe Address, :type => :model do
  describe 'Associations' do
    it { should belong_to(:profile) } 
  end
  
  describe 'Validations' do
    it { should validate_presence_of(:street).on(:create) }
    it { should validate_presence_of(:suite).on(:create) }
    it { should validate_presence_of(:city).on(:create) }
    it { should validate_presence_of(:zipcode).on(:create) }
  end
  
end
