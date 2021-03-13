class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(sign_up_params)
    if @user.save
      flash[:notice] = 'User created successfully'
      session[:user_id] = @user.id
      session[:username] = @user.name
      redirect_to articles_path
    else
      flash[:alert] = 'User not created, please try again'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    flash[:success] = 'Log out with succes'
    redirect_to root_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:name)
  end
end
