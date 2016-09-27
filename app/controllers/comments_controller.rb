class CommentsController < ApplicationController
  def create
    @comment = Comment.create(create_params)
    @comments = Comment.where(prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new
  end

  private
  def create_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
