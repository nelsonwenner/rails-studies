require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  describe 'POST #create' do
    let(:valid_comment) { FactoryBot.attributes_for(:comment) }
    
    context 'With valid attributes' do
      let(:profile) { FactoryBot.create(:profile) }
      let(:post_curr) { FactoryBot.create(:post, profile_id: profile.id) }
      
      it 'Create a new comment' do
        post :create, params: { comment: valid_comment, post_id: post_curr.id }
        expect(assigns(:comment)).to be_a(Comment)
      end
    end
    
    context 'With invalid post_id' do
      it 'Does not creates a new Comment' do
        expect{
          post :create, params: { comment: valid_comment, post_id: -1 }
        }.to change(Comment, :count).by(0)
      end
    end
  end

  describe 'GET #index' do
    let(:profile) { FactoryBot.create(:profile) }
    let(:post_curr) { FactoryBot.create(:post, profile_id: profile.id) }
    
    it 'Should have one Comment' do
      FactoryBot.create(:comment, post_id: post_curr.id)
      get :index
      expect(response).to be_successful
    end
  end

end
