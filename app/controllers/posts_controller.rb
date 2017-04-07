class PostsController < ApplicationController
  before_action :authenticate_user!, :only=>[:new, :create]
  before_action :find_group_and_check_permission, :only=>[:new,:create,:show]

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)

    @post.group = @group
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = current_user.posts.find(params[:id])
    session[:return_to] ||= request.referer
  end

  def update
    @group = Group.find(params[:group_id])
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
     redirect_to session.delete(:return_to)

    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def find_group_and_check_permission

    @group = Group.find(params[:group_id])
    if !current_user.is_member_of?(@group)
      redirect_to group_path(@group), alert: "非本討論版成員，請先加入討論版"
    end
  end
end
