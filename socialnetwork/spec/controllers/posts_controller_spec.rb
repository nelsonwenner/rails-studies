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
  end
  
end
