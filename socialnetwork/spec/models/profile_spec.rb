require 'rails_helper'

RSpec.describe Profile, :type => :model do
  describe 'Associations' do
    it { should have_one(:address) }
    it { should have_many(:post) }  
  end
  
  describe 'Validations' do
    it { should validate_presence_of(:name).on(:create) }
    it { should validate_presence_of(:email).on(:create) }
  end
  
end