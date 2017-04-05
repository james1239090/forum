class Account::LikesController < ApplicationController
  def index
    @likes =  current_user.likes.includes(:post)
  end
end
