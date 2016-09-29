class CommentsController < ApplicationController
  def create
    Comment.create(create_params)
    @prototype = Prototype.find(params[:prototype_id])
  end

  private
  def create_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
