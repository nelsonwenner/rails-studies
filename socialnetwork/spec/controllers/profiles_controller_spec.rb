require 'rails_helper'

RSpec.describe ProfilesController, :type => :controller do
  describe 'POST #create' do
    let(:valid_profile) { FactoryBot.attributes_for(:profile) }
    let(:invalid_profile) { FactoryBot.attributes_for(:profile, email: nil) }
    
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

    context 'With invalid attributes' do
      it 'Does not creates a new Profile' do
        post :create, params: { profile: invalid_profile }
        expect(response.status).to equal(400)
      end
    end
  end

  describe 'GET #index' do
    it 'Should have one Profile' do
      FactoryBot.create(:profile)
      get :index
      expect(response).to be_successful
    end
  end

  context 'GET #show' do
    let(:profile) { FactoryBot.create(:profile) }

    it 'Should success' do
      get :show, params: { id: profile.id }
      expect(response).to be_successful
    end

    it 'Where have id' do
      get :show, params: { id: profile.id }
      expect(assigns(:profile)).to be_a(Profile)
    end
  end
  
  context 'PUT #update' do
    let!(:profile) { FactoryBot.create(:profile) }

    it "Should update profile" do
      params = { email: 'wenner@mail.com' }
      put :update, params: { id: profile.id, profile: params }
      profile.reload
      expect(profile.email).to eq(params[:email])
    end
  end

  context 'DELETE #destroy' do
    let(:profile) { FactoryBot.create(:profile) }

    it "Should delete profile" do
      expect{
        delete :destroy, params: { id: profile.id }
      }.to change(Profile, :count).by(0)
    end
  end
end
