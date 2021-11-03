class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_post_likes_counter
    post.update_column('likes_counter', post.likes_counter + 1)
  end
end
