class CommentsController < ApplicationController
  before_filter(:authenticate, :only => [:create])

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to(:back, :notice => 'Comment Succeeded')
    else
      redirect_to(:back, :notice => 'Comment Failed')
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :image_owner_id)
    end
end
