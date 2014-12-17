class ProfilesController < ApplicationController
  before_action :set_user, only: [:show,:edit, :update]
  layout "dashboard"

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:civility, :first_name, :last_name, :birthday, :email)
  end

  def set_user
    @user = current_user
  end
end
