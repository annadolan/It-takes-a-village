class ConfirmationsController < ApplicationController

  def new
    # @user = User.find_by(phone: params[:user][:phone])
  end

  def edit
    @user = User.find_by(phone: params[:user][:phone])
    ConfirmationSender.send_confirmation_to(@user)
  end

  def update
    @user = User.find_by(verification_code: params[:user][:verification_code])
    if @user.verification_code == params[:user][:verification_code]
      session[:authenticated] = true
      @user.update_attributes(password: params[:user][:password])
      flash[:notice] = "You have successfully updated your password!"
      redirect_to root_path
    else
      flash.now[:error] = "Verification code is incorrect."
      render :new
    end
  end
end
