class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.includes(:group).recent
  end


  def edit

  end

  def destroy


  end

  def update

  end
end
