class PostsController < ApplicationController
  
  # before_action :ensure_permission
  
  def index
    @posts = Post.where(sub_id: params[:sub_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.sub_id = params[:sub_id]
    @post.author_id = current_user.id
    if @post.save 
      redirect_to sub_post_url(@post)
    else 
      flash[:errors] = @post.errors.full_messages
      render :new
    end 
  end

  def edit
    @post = current_user.posts.find(params[:id])
    flash[:errors] = ['not found'] unless @post 
    render :edit
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to sub_post_url(@post)
    else 
      flash[:errors] = @post.errors.full_messages
      render :edit
    end 
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to link_url(@post.link_id)
  end
  
  private
  
  # def ensure_permission
  #   @post = current_user.posts.find(params[:id]) if logged_in?
  #   # redirect_to sub_post_url(params[:id]) unless @post && !logged_in
  # end 
  
  def post_params
    params.require(:post).permit(:title, :url, :content)
  end 
end
