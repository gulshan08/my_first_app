class RepliesController < ApplicationController
	def new
	  @comment=Comment.find(params[:id])
	end
	def reply_param
	  params.require(:reply).permit(:reply ).merge(user_id: current_user.id,post_id: @post.id)
	end
end
