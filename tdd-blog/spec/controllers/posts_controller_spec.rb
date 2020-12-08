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

  context 'GET #show' do
    let(:post) { FactoryBot.create(:post) }

    it 'Should success' do
      get :show, params: { id: post.id }
      expect(response).to have_http_status(200)
    end

    it 'Where have id' do
      get :show, params: { id: post.id }
      expect(assigns(:post)).to be_a(Post)
    end
  end

  context 'GET #new' do
    it 'Should success' do
      get :new
      expect(response).to have_http_status(200)
    end

    it 'Should new post' do
      get :new
      expect(assigns(:post)).to be_a(Post)
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  context 'GET #edit' do
    let(:post) { FactoryBot.create(:post) }
    it 'Should success' do
      get :edit, params: { id: post.id }
      expect(assigns(:post)).to be_a(Post)
    end
  end
  
  context 'POST #create' do
    let(:valid_post) { attributes_for(:post) }

    it "create a new Post" do
      post :create, params: { post: valid_post }
      expect(assigns(:post)).to be_a(Post)
    end
  end
  
  context 'PUT #update' do
    # let! variable in memory
    let!(:post) { FactoryBot.create(:post) }

    it "Should update post info" do
      params = { title: 'update title post' }

      put :update, params: { id: post.id, post: params }
      post.reload
      expect(post.title).to eq(params[:title])
    end
  end

  context 'DELETE #destroy' do
    let(:post) { FactoryBot.create(:post) }

    it "Should delete post" do
      expect{
        delete :destroy, params: { id: post.id }
      }.to change(Post, :count).by(0)
    end
  end
end
