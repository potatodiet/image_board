class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @user = User.find(params[:id])
    @images = @user.images.order('created_at desc').paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    # Allow user to leave password unchanged
    params[:user].delete(:password) if params[:user][:password].blank?

    if @user.update(user_params)
      redirect_to(user_path(@user))
    else
      render(:edit)
    end
  end

  private

  def user_params
    allowed_params = %i[name email password current_password]
    allowed_params << :role if can?(:assign_roles, current_user)
    params.require(:user).permit(allowed_params)
  end
end
