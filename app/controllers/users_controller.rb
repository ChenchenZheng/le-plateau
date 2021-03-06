class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  def show
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render partial: 'user_infos.html', locals: { user: @user }
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birth_date, :photo, :email)
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
