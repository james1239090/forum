class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
  end


  def edit

  end

  def destroy
   puts "-------------"

  end

  def update

  end
end