class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @author_id = params[:id]
  end
end
