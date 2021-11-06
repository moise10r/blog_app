class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.top_most_recent_posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    new_post = Post.new(post_params)
    current_user.posts << new_post
    new_post.update_post_counter
    if new_post.save
      flash[:notice] = 'Post created!'
      redirect_to user_posts_path(new_post.user.id)
    else
      flash.now[:alert] = 'Failed to create post!'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
