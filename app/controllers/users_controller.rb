class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :info]

  def show
    if current_user
      @user = User.find_by(slug: params[:user])
    else
      render :file => "/public/404"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Successfully created an account!"
      redirect_to info_path(@user)
    else
      @categories = Category.all
      flash[:danger] = "Something went wrong. Please try again."
      render :new
    end
  end

  def info

  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "#{@user.first_name}'s account updated!"
      redirect_to dashboard_path
    else
      flash.now[:danger] = "Account didn't update. Try again."
      render :edit
    end
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
                                   :picture,
                                   :avatar,
                                   task_ids:[])
    end

    def set_user
      @user = current_user
    end

end
