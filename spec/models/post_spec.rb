require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Post 1', text: 'Post 1 content') }

  before { subject.save }

  describe 'validations' do
    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title length should be less than 250' do
      subject.title = 'title ' * 300
      expect(subject).to_not be_valid
    end

    it 'text should be present' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'comments_counter should be present' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'likes_counter should be present' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'update_post_counter' do
    it 'should update post counter for the user who created post' do
      new_user = User.new(name: 'wale', bio: 'Short bio')
      new_user.save
      new_post = Post.new(user_id: new_user.id, title: 'Post 2', text: 'Post 2 content')
      new_post.update_post_counter
      expect(new_post.user.posts_counter).to eq(1)
    end
  end

  describe 'most_recent_comments limit 5' do
    it 'when total comments for a post is less than 5 limit comments to 5' do
      comment = Comment.new(user_id: 1, post_id: subject.id, text: 'Comment 1')
      subject.comments << comment
      expect(subject.most_recent_comments.size).to be <= 5
    end

    it 'when total comments for a post is greater than 5 limit comments to 5' do
      comment1 = Comment.new(user_id: 1, post_id: subject.id, text: 'Comment 1')
      subject.comments << comment1
      comment2 = Comment.new(user_id: 1, post_id: subject.id, text: 'Comment 2')
      subject.comments << comment2
      comment3 = Comment.new(user_id: 1, post_id: subject.id, text: 'Comment 3')
      subject.comments << comment3
      comment4 = Comment.new(user_id: 1, post_id: subject.id, text: 'Comment 4')
      subject.comments << comment4
      comment5 = Comment.new(user_id: 1, post_id: subject.id, text: 'Comment 5')
      subject.comments << comment5
      comment6 = Comment.new(user_id: 1, post_id: subject.id, text: 'Comment 6')
      subject.comments << comment6
      expect(subject.most_recent_comments.size).to be <= 5
    end
  end
end
