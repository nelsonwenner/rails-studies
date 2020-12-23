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

end
