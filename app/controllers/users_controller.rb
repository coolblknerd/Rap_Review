class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :find_user, only: [:show, :update, :destroy]
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    authorize @user
  end

  def update
    authorize User

    if @user.update_attributes(user_params)
      redirect_to users_path, success: 'User updated'
    else
      redirect_to users_path, alert: 'Unable to update user'
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to users_path, notice: "User deleted"
  end

private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role)
  end

end
