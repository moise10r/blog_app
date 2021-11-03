class PostsController < ApplicationController
  def index
    @auh_id = params[:author_id]
  end

  def show
    @author_id = params[:author_id]
    @post_id = params[:id]
  end
end
