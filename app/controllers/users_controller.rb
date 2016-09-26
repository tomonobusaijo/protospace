class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
  end

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.paginate(params, 8)
  end

  def update
    current_user.update(update_params)
    flash[:success] = "Profile edit is completed."
    redirect_to :root and return
  end

  private
  def update_params
    params.require(:user).permit(:name, :member, :profile, :works)
  end
end
