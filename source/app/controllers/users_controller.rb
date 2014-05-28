class UsersController < ApplicationController
  load_and_authorize_resource
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if verify_recaptcha && @user.save
      session[:user_id] = @user.id

      redirect_to(user_path(@user), :notice => 'Signed Up!')
    else
      render(:new)
    end
  end

  def show
    @user = User.find(params[:id])
    @images = @user.images.order('created_at desc')
        .paginate(:page => params[:page])
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
