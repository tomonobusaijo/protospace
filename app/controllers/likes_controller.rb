class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
  end

  def destroy
    current_user.likes.find_by(prototype_id: params[:prototype_id]).destroy
    @likes = Like.where(prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
  end
end
