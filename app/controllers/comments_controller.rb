class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = Comment.new(comment_params)
    @comment.commenter = current_user

    if @comment.save
      redirect_back(fallback_location: @comment.image_owner)
    else
      redirect_back(fallback_location: @comment.image_owner, alert: 'Failed to post comment.')
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.destroy
      redirect_to(@comment.image_owner)
    else
      redirect_to(@comment.image_owner, alert: 'Failed to delete comment.')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :image_owner_id)
  end
end
