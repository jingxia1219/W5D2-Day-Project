class CommentsController < ApplicationController
  
  def new 
    @comment = Comment.new
  end    
  
  def create 
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save 
      redirect_to sub_post_url(Post.find(params: [:post_id]).sub_id, params[:post_id])
    else 
      flash[:errors] = @comment.errors.full_messages
      redirect_to sub_post_url(Post.find(params: [:post_id]).sub_id, params[:post_id])
    end 
  end 
  
  private 
  def comment_params
    params.require(:comment).permit(:content)
  end 
end
