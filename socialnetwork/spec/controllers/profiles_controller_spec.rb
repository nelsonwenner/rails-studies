require 'rails_helper'

RSpec.describe ProfilesController, :type => :controller do
  describe 'POST#create' do
    let(:valid_profile) { FactoryBot.attributes_for(:profile) }
    #let(:invalid_profile) { attributes_for(:profile, name: -1) }
    
    context 'With valid attributes' do
      it 'Create a new profile' do
        expect{
          post :create, params: { profile: valid_profile }
        }.to change(Profile, :count).by(1)
      end
    end
  end
  
end