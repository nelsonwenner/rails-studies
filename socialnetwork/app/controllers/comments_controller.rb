class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  
  def index
    @comments = Comment.all()
    return render status: 200, json: @comments.as_json()
  end

  def create
    @comment = Comment.new(comment_params)
    
    if @comment.save()
      return render status: 201, json: @comment.as_json
    else
      return render status: 400, json: @comment.errors.to_json   
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end
    
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
