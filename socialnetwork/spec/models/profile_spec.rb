require 'rails_helper'

RSpec.describe Profile, :type => :model do
  describe 'Associations' do
    it { 
      should have_many(:requester_invitations)
      .class_name('Invitation')
      .with_foreign_key('requester_id') 
    }    
    it { 
      should have_many(:frienships_invitations)
      .class_name('Invitation')
      .with_foreign_key('guest_id') 
    }
    it { 
      should have_many(:friends)
      .class_name('Profile')
      .through(:friendships)
    }
    it { should have_one(:address) }
    it { should have_many(:post) }
  end
  
  describe 'Validations' do
    it { should validate_presence_of(:name).on(:create) }
    it { should validate_presence_of(:email).on(:create) }
  end
  
end