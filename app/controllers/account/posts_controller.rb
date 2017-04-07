class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.includes(:group).recent.paginate(:page=> params[:page], :per_page=> 5)
  end


  def edit

  end

  def destroy


  end

  def update

  end
end
