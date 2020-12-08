require 'rails_helper'

RSpec.describe Post, :type => :model do
  context 'Validation title post' do
    it 'Should be valid' do
      post = Post.new(title: 'One post', content: 'My content')
      expect(post).to be_valid 
    end

    it 'Should be invalid' do
      post = Post.new(content: 'My content')
      expect(post).to_not be_valid 
    end
  end

  context 'Validation content post' do
    it 'Should be valid' do
      post = Post.new(title: 'One post', content: 'My content')
      expect(post).to be_valid 
    end

    it 'Should be invalid' do
      post = Post.new(title: 'One post')
      expect(post).to_not be_valid 
    end
  end
end
