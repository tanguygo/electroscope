class ProfileController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  layout "dashboard"


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
      if @user.save
        redirect_to edit_profile_path
      else
        render :edit
      end
  end

  private

  def user_params
    params.require(:user).permit(:civility, :first_name, :last_name, :birthday, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
