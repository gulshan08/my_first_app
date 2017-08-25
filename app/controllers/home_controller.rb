class HomeController < ApplicationController
 before_action :authenticate_user!
 def index
 	@users=User.all
 	@account = current_user.account
 	@posts = current_user.posts
 	@post = Post.new
 end

end
