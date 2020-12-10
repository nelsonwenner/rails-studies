require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe 'Associations' do
    it { should belong_to(:profile) }
    it { should have_many(:comment) }  
  end
  
  describe 'Validations' do
    it { should validate_presence_of(:title).on(:create) }
    it { should validate_presence_of(:body).on(:create) }
  end
  
end