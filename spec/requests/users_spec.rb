require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }

    it 'should have correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end

    it 'should include correct placeholder text' do
      expect(response.body).to include('Here there is a list of users')
    end
  end

  describe 'GET #show' do
    before(:example) { get user_path(10) }

    it 'should have correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'should render correct template' do
      expect(response).to render_template(:show)
    end

    it 'should include correct placeholder text' do
      expect(response.body).to include('Show the details of one user')
    end
  end
end
