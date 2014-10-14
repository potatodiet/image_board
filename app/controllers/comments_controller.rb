class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = Comment.new(comment_params)
    @comment.commenter = current_user

    if @comment.save
      redirect_to(:back, notice: "Comment Succeeded")
    else
      redirect_to(:back, notice: "Comment Failed")
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to(@comment.image_owner, notice: "Comment Destroyed")
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :image_owner_id)
    end
end
