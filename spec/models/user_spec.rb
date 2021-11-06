require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'wale', bio: 'Short bio', posts_counter: 0) }

  before { subject.save }

  describe 'validations' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be present' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'top_most_recent_posts' do
    it 'when total posts is less than 3 limit post to 3' do
      post = Post.new(title: 'Post 1', text: 'post 1 content')
      subject.posts << post
      expect(subject.top_most_recent_posts.size).to be <= 3
    end

    it 'when total posts is greater than 3 limit posts to 3' do
      post1 = Post.new(title: 'Post 1', text: 'post 1 content')
      subject.posts << post1
      post2 = Post.new(title: 'Post 2', text: 'post 2 content')
      subject.posts << post2
      post3 = Post.new(title: 'Post 3', text: 'post 3 content')
      subject.posts << post3
      post4 = Post.new(title: 'Post 4', text: 'post 4 content')
      subject.posts << post4
      expect(subject.top_most_recent_posts.size).to be <= 3
    end
  end
end
