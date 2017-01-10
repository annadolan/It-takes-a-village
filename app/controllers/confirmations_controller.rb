class ConfirmationsController < ApplicationController

  def new
  end

  def edit
    @user = User.find_by(phone: params[:user][:phone])
    if @user.nil?
      flash[:danger] = "Couldn't find your phone number."
      redirect_to confirm_path
    else
      ConfirmationSender.send_confirmation_to(@user)
    end
  end

  def update
    @user = User.find_by(verification_code: params[:user][:verification_code])
    if @user.verification_code == params[:user][:verification_code]
      session[:authenticated] = true
      @user.update_attributes(password: params[:user][:password])
      flash[:success] = "You have successfully updated your password!"
      redirect_to login_path
    else
      flash.now[:danger] = "Verification code is incorrect."
      render :new
    end
  end
end
