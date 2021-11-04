class UsersController < ApplicationController
  def index
    @users = %w[moise rushanika Nganulo]
  end

  def show
    @author_id = params[:id]
  end
end
