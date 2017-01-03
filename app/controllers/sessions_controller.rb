class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in!"
      redirect_to user_path(@user)
    else
      flash[:error] = "Something went wrong with your login. Please try again."
      render :new
    end
  end

  def destroy
    session.destroy
    flash[:success] = "You Successfully Logged out!"
    redirect_to root_path
  end

end
