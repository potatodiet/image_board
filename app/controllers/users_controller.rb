class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @user = User.find(params[:id])
    @images = @user.images.order("created_at desc").paginate(page: params[:page])
  end
end
