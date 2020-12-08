require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
  context 'GET #index' do
    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
    end
    
    it 'should array empty' do
      get :index
      expect(assigns(:posts)).to be_empty
    end

    it 'should have one post' do
      FactoryBot.create(:post)
      get :index
      expect(assigns(:posts)).to_not be_empty
    end
  end
end
