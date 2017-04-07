class CommentsController < ApplicationController
  before_action :authenticate_user!, :only=>[:new, :create]


  def new
    @group =Group.find(params[:group_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end


  def create
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)

    @comment.post = @post
    @comment.user = current_user

    if @comment.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
