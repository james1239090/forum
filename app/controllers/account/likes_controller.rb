class Account::LikesController < ApplicationController
  def index
    @posts =  current_user.like_posts.includes(:user,:group)
  end
end
