class Prototypes::TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def show
    @tag = params[:id]
    @prototype = Prototype.tagged_with(@tag)
  end
end
