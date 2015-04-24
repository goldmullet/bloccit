class FavoritesController < ApplicationController

  def create
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: post)
     authorize favorite
     if favorite.save
      flash[:notice] = "Favorite was saved."
      redirect_to [post.topic, post]
       
     else
      flash[:error] = "There was an error trying to favorite. Please try again."
    
     end
   end

   def destroy
   @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
    authorize favorite
    if favorite.destroy
      flash[:notice] = "You hate this post now :)"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "ERROR: Somthing went wrong and this is still your favorite post."
      redirect_to [@post.topic, @post]
   end
 end
end


   