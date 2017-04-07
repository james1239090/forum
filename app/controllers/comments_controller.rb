class CommentsController < ApplicationController
  before_action :authenticate_user!, :only=>[:new, :create, :edit, :update, :destroy]


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

  def edit
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.find(params[:id])
    session[:return_to] ||= request.referer
  end

  def update
    @comment = current_user.comments.find(params[:id])
    if @comment.update(comment_params)
     redirect_to session.delete(:return_to)
    else
      render :edit
    end

  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end


  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
