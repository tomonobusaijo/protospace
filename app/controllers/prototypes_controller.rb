class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
  end

  def show
  end

  def create
    @prototype = Prototype.create(create_params)
    flash[:success] = "Prototype posting is completed."
    redirect_to :root and return
  end

  private
  def create_params
    params.require(:prototype).permit(:title, :catchcopy, :concept).merge(user_id: current_user.id)
  end
end
