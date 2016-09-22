class PrototypesController < ApplicationController
  def index
    @prototype = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
    @prototype.capturedimages.build
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def create
    Prototype.create(create_params)
    flash[:success] = "Prototype was successfully created."
    redirect_to :root and return
  end

  private
  def create_params
    params.require(:prototype).permit(
      :title,
      :catchcopy,
      :concept,
      capturedimages_attributes: [
        :prototype_id,
        :role,
        :picture
      ]).merge(user_id: current_user.id)
  end
end
