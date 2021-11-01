class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  validates :title, :text, presence: true

  def update_counter(author_id)
    count_posts = Post.where(author_id: author_id).count
    User.find_by(id: author_id).update(post_counter: count_posts)
  end

  def recent_comment(post_id)
    Comment.where(post_id: post_id).order(created_at: :desc).limit(5)
  end
end
