class PostsController < ApplicationController
	def index
		@posts = Post.order('created_at ASC')
	end
end
