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
    @user = User.where(:username => params[:user][:username]).first ||= User.new

    if @user.needs_captcha? && !verify_recaptcha
      render(:new)
      return false
    end

    if !@user.authenticate(params[:user][:password]) && !@user.is_locked?
      flash.now[:alert] = 'Invalid Credentials'
      render(:new)
    elsif @user.is_locked?
      flash.now[:alert] =  "This account is locked for #{@user.lockout_time_left.to_s} " +
          'minutes due to too many failed login attempts!'
      render(:new)
    else
      session[:user_id] = @user.id

      redirect_to(user_path(@user), :notice => 'Signed In!')
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
