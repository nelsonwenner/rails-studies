require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
  describe 'POST #create' do
    let(:valid_post) { FactoryBot.attributes_for(:post) }
    
    context 'With valid attributes' do
      let(:profile) { FactoryBot.create(:profile) }
      
      it 'Create a new post' do
        post :create, params: { post: valid_post, profile_id: profile.id }
        expect(assigns(:post)).to be_a(Post)
      end
    end
    
    context 'With invalid profile_id' do
      it 'Does not creates a new Post' do
        expect{
          post :create, params: { post: valid_post, profile_id: -1 }
        }.to change(Post, :count).by(0)
      end
    end
  end

  describe 'GET #index' do
    let(:profile) { FactoryBot.create(:profile) }
    
    it 'Should have one Post' do
      FactoryBot.create(:post, profile_id: profile.id)
      get :index
      expect(response).to be_successful
    end
  end

end
