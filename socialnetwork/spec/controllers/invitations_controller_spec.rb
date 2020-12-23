require 'rails_helper'

RSpec.describe InvitationsController, :type => :controller do
  describe 'POST #create' do
    context 'with valid attributes'do
      let(:profile_one) { FactoryBot.create(:profile) }
      let(:profile_two) { FactoryBot.create(:profile) }

      it 'Should create a new invitation' do
        response = post :create, params: { 
          requester_id: profile_one.id,
          guest_id: profile_two.id
        }, as: :json
        
        expect(response.status).to equal(201)
        expect(assigns(:invitation)).to be_a(Invitation)
      end
    end
  end
  
  describe 'POST #accept' do
    context 'with valid attributes'do
      let(:profile_one) { FactoryBot.create(:profile) }
      let(:profile_two) { FactoryBot.create(:profile) }

      it 'Should accept invitation' do
        invitation = FactoryBot.create(:invitation, 
          requester_id: profile_one.id,
          guest_id: profile_two.id
        )
        
        expect{
          post :accept, params: { id: invitation.id }
        }.to change(Friendship, :count).by(2)
      end
    end
  end

  describe 'DELETE #reject' do
    context 'with valid attributes'do
      let(:profile_one) { FactoryBot.create(:profile) }
      let(:profile_two) { FactoryBot.create(:profile) }

      it 'Should reject invitation' do
        invitation = FactoryBot.create(:invitation, 
          requester_id: profile_one.id,
          guest_id: profile_two.id
        )

        response = post :reject, params: { id: invitation.id }
        expect(response.status).to equal(204)
      end
    end
  end

end
