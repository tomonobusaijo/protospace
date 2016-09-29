class Prototypes::NewestController < ApplicationController
  def index
    @prototype = Prototype.order('created_at DESC').paginate(params, 8)
  end
end
