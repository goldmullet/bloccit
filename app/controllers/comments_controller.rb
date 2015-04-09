class CommentsController < ApplicationController
  def create
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

  def destroy
     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
   end
   
private
 def comments_params
  params.require(:comment).permit(:body) 
 end 
end