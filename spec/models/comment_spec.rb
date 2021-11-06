require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'update_post_comments_counter' do
    it 'should update comments counter for a post' do
      user = User.create(name: 'wale', bio: 'bio')
      post = Post.create(user_id: user.id, title: 'Post 1', text: 'Post 2 body')
      comment = Comment.create(user_id: user.id, post_id: post.id, text: 'Comment')
      comment.update_post_comments_counter
      expect(comment.post.comments_counter).to eq(1)
    end
  end
end
