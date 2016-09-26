class PrototypesController < ApplicationController

  before_action :set_prototype, only:[:show, :edit, :update, :destroy]

  def index
    @prototype = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
    @prototype.capturedimages.build
  end

  def show
    @likes = @prototype.likes.where(prototype_id: params[:id])
  end

  def create
    @prototype = Prototype.new(create_params)
    if @prototype.save
      flash[:success] = "Prototype was successfully created."
      redirect_to :root and return
    else
      flash[:danger] = "Prototype posting was failured."
      redirect_to new_prototype_path and return
    end
  end

  def edit
  end

  def update
    if @prototype.update(update_params)
      flash[:success] = "Prototype was successfully updated."
      redirect_to :root and return
    else
      flash[:danger] = "Prototype editing was failured."
      redirect_to edit_prototype_path and return
    end
  end

  def destroy
    prototype.destroy
    flash[:success] = "Prototype was successfully deleted."
    redirect_to :root and return
  end


  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

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

  def update_params
    params.require(:prototype).permit(
      :title,
      :catchcopy,
      :concept,
      capturedimages_attributes: [
        :id,
        :prototype_id,
        :role,
        :picture,
        :_destroy
      ]).merge(user_id: current_user.id)
  end
end
