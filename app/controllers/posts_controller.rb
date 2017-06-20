class PostsController < ApplicationController
	def index
		@posts = Post.order("created_at DESC").all
		respond_to do |format| 
			format.html
		end
	end

	def create
		@post = Post.create(
			:message => params[:message]
		)
		respond_to do |format|
			if @post.save
				format.js
			else 
				flash[:notice] = "Message failed to save"
			end
			format.html { redirect_to posts_path }
		end
	end
end
