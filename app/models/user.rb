class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def top_most_recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
