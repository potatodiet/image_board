class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @user = User.find(params[:id])
    @images = @user.images.order("created_at desc").paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    #Allow user to leave password unchanged
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    if @user.update(user_params)
      redirect_to(user_path(@user), notice: "Successfully updated account")
    else
      render(:edit)
    end
  end

private
  def user_params
    allowed_params = [:name, :email, :password, :current_password]
    allowed_params << :role if can?(:assign_roles, current_user)
    params.require(:user).permit(allowed_params)
  end
end
