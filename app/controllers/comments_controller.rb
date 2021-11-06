class CommentsController < ApplicationController
  def create
    post = Post.find(params[:id])
    new_comment = Comment.create(user_id: current_user.id, post_id: post.id, text: comment_params[:text])
    new_comment.update_post_comments_counter
    if new_comment.save
      flash[:notice] = 'Comment created!'
      redirect_to user_post_path(post.user.id, post.id)
    else
      flash.now[:error] = 'Unable to create comment!'
      redirect_to user_post_path(post.user.id, post.id), alert: 'Failed to add comment!'
    end
  end

  private

  def comment_params
    params.require(:data).permit(:text)
  end
end
