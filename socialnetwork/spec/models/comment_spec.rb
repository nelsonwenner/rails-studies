require 'rails_helper'

RSpec.describe Comment, :type => :model do
  describe 'Associations' do
    it { should belong_to(:post) } 
  end
  
  describe 'Validations' do
    it { should validate_presence_of(:body).on(:create) }
  end
  
end