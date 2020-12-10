require 'rails_helper'

RSpec.describe ProfilesController, :type => :controller do
  describe 'POST#create' do
    let(:valid_profile) { FactoryBot.attributes_for(:profile) }
    let(:invalid_profile) { FactoryBot.attributes_for(:profile, name: -1) }
    
    context 'With valid attributes' do
      it 'Create a new profile' do
        post :create, params: { profile: valid_profile }
        expect(assigns(:profile)).to be_a(Profile)
      end
      
      it 'Saves profile address' do
        expect{
          post :create, params: { profile: valid_profile }
        }.to change(Address, :count).by(1)
      end
    end
  end

end