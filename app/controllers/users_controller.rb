class UsersController < ApplicationController
  def index; end

  def show
    @author_id = params[:id]
  end
end
