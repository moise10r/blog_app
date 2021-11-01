class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts

  def self.recent_posts(id)
    Post.where(author_id: id).limit(3)
  end
end
