require 'rails_helper'

RSpec.describe FriendshipsController, :type => :controller do
  describe 'DELETE #undo' do
    context 'with valid attributes'do
      let(:profile_one) { FactoryBot.create(:profile) }
      let(:profile_two) { FactoryBot.create(:profile) }
      
      it 'Should undo friendship' do
        FactoryBot.create(:invitation, 
          requester_id: profile_one.id,
          guest_id: profile_two.id
        )
        FactoryBot.create(:friendship, 
          profile_id: profile_one.id,
          friend_id: profile_two.id
        )
     
        expect{
          delete :undo, params: { 
            profile_id: profile_one.id,
            friend_id: profile_two.id
          }
        }.to change(Friendship, :count).by(0)
      end
    end
  end
  
end
