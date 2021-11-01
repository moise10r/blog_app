class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_counter(post_id)
    count_likes = Like.where(post_id: post_id).count
    Post.find_by(id: post_id).update(likes_counter: count_likes)
  end
end
