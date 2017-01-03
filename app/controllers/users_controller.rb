class UsersController < ApplicationController

  def new
    @user = User.new
    @categories = Category.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Successfully created an account!"
      redirect_to user_path(@user)
    else
      @categories = Category.all
      flash[:error] = "Something went wrong. Please try again."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :street_number,
                                 :unit_number,
                                 :city,
                                 :state,
                                 :zip_code,
                                 :phone,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :picture)
  end

end
