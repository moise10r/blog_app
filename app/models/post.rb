class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def update_post_counter
    user.update_column('posts_counter', user.posts_counter + 1)
  end

  def most_recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
