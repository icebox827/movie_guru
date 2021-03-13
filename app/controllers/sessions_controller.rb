class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:session][:user])

    if @user
      session[:user_id] = @user.id
      session[:username] = @user.name
      redirect_to articles_path
    else
      flash[:alert] = 'Wrong login info'
      render 'new'
    end
  end

  def destroy
    reset_session
    flash[:success] = 'Log out successfully'
    redirect_to root_path
  end
end
