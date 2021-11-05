class PostsController < ApplicationController
  def index
    @user = User.find(params[:author_id])
    @posts = @user.top_most_recent_posts
  end

  def show
    @user = User.find(params[:author_id])
    @post = Post.find(params[:id])
  end
end
