class CommentsController < ApplicationController
	respond_to :html, :js
  def new
    @post=Post.find(params[:post_id])
    @comment=Comment.new
    @comment.photos.build
  end
  def create
    post = Post.find(params[:id])
    @comment = post.comments.create(comment_params)
    @comment.save
     respond_to do |format|
      format.js
    #redirect_to root_path
   end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
   
    respond_to do |format|
      #format.html { redirect_to ponies_url }
      #format.json { head :no_content }
    format.js 
    end
   
  end

   private
  def comment_params
    params.require(:comment).permit(:comment ,photos_attributes: [:id,:photo_image,:_destroy]).merge(user_id: current_user.id)
  end
end



