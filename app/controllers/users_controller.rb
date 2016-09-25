class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    current_user.update(update_params)
    flash[:success] = "Profile was successfully updated."
    redirect_to :root and return
  end

  private
  def update_params
    params.require(:user).permit(:name, :member, :profile, :works)
  end
end
