class PostsController < ApplicationController
  respond_to :html, :js
  def new
    @post=Post.new
    @post.photos.build
  end

  def create
    @post = current_user.posts.create(post_params)
    @post.save
      respond_to do |format|
        format.js
      end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
   
    respond_to do |format|
      #format.html { redirect_to ponies_url }
      #format.json { head :no_content }
    format.js 
    end
   
  end
 
  private
  def post_params
    params.require(:post).permit(:post,photos_attributes: [:id,:photo_image, :_destroy])
  end
end