class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_comments_counter
  before_validation :trim_text

  def update_post_comments_counter
    post.update_column('comments_counter', post.comments_counter + 1)
  end

  private

  def trim_text
    self.text = text.strip if text.present?
  end
end
