class PostsController < ApplicationController
  def index
    @user = User.find(params[:author_id])
  end

  def show
    @user = User.find(params[:author_id])
    @post_id = params[:id]
  end
end
