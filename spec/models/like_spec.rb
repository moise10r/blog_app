require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'update_post_likes_counter' do
    it 'should update likes counter for a post' do
      user = User.create(name: 'wale', bio: 'bio')
      post = Post.create(user_id: user.id, title: 'Post 1', text: 'Post 2 body')
      like = Like.create(user_id: user.id, post_id: post.id)
      like.update_post_likes_counter
      expect(like.post.likes_counter).to eq(1)
    end
  end
end
