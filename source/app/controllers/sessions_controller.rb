class SessionsController < ApplicationController
  before_filter(:already_signed_in, :only => [:new, :create])
  before_filter(:authenticate, :only => [:destroy])

  def new
    if session[:user_id]
      redirect_to(root_path)
    end

    @user = User.new
  end

  def create
    @user = User.authenticate(params[:user][:username], params[:user][:password])

    if @user
      session[:user_id] = @user.id

      redirect_to(user_path(@user), :notice => 'Signed In!')
    else
      @user = User.new(user_params)

      flash.now[:alert] = 'Invalid credentials'
      render(:new)
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to(root_path, :notice => 'Signed Out!')
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
