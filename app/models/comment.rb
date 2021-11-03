class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :text, presence: true

  def update_post_comments_counter
    post.update_column('comments_counter', post.comments_counter + 1)
  end
end
