class CommentsController < ApplicationController
  def create
  
   
    @post = Post.find(params[:post_id])
    @topic= @post.topic
    @comments = @post.comments
    @comment = current_user.comments.build(comments_params)
    @comment.post = @post
    @new_comment = Comment.new

    if @comment.save
      redirect_to [@topic, @post]
    else 
      flash[:error] = "Error creating comment. Please try again."
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
       
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       
     end
          respond_to do |format|
       format.html
       format.js
     end
   end
   
private
 def comments_params
  params.require(:comment).permit(:body) 
 end 
end