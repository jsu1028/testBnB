class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @bookings = @user.bookings
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Successful update"
      redirect_to @user
    else
      flash[:danger] = "Error updating user"
      render :edit
    end
  end

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
