class CommentsController < ApplicationController
  def create
    # @post = Post.find(params[:post_id])
    # @comment = current_user.comments.build(comment_params)
    # @comment.post = @post
    # authorize @comment
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = current_user.comments.build(comments_params)
    @comment.post = @post
    if @comment.save
      redirect_to [@topic, @post]
    else 
      render :new
    end  
  end
private
 def comments_params
  params.require(:comment).permit(:body) 
 end 
end