class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      # loggin
      log_in(user)
      redirect_to root_path, notice: 'You have logged in successfully!'
    else
      flash.now[:error] = 'Invalid User name!'
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
