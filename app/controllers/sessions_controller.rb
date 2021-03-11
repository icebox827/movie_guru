class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:session][:user])
    @user ||= User.find(params[:session][:user].to_i)

    if @user
      session[:user_id] = @user.id
      session[:username] = @user.name
      redirect_to articles_path
    else
      flash.now[:danger] = 'Wrong login info'
      render 'new'
    end
  end

  def destroy
    reset_session
    # session[:username] = nil
    flash[:success] = 'Log out successfully'
    redirect_to root_path
  end
end
