class LikesController < ApplicationController
  before_action :authenticate_user!, :only=>[:new, :create,:destroy]
  def create
    @post = Post.find(params[:post_id])

    if !@post.is_like?(current_user)
      @like = @post.likes.new
      @like.user_id = current_user.id
      @like.save
    end
    redirect_to '/'
  end

  def destroy
    @post = Post.find(params[:post_id])
    if @post.is_like?(current_user)
      @post.likes.where(user_id: current_user.id).destroy_all
    end
    redirect_to '/'
  end

end
