class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def create
    @post = Post.new(post_params)
    
    if @post.save()
      return render status: 201, json: @post.as_json(include: :comment)
    else
      return render status: 400, json: @post.errors.to_json   
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:title, :body, :profile_id)
    end
end
