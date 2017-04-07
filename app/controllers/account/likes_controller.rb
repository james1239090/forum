class Account::LikesController < ApplicationController
  def index
    @posts =  current_user.like_posts.includes(:user,:group).recent.paginate(:page=> params[:page], :per_page=> 5)
  end
end
