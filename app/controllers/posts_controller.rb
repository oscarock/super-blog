class PostsController < ApplicationController
	def index
		@posts = Post.order('created_at ASC')
	end

	def  new
		@posts = Post.new	
	end

	def create
		@posts = Post.new(post_params)
		if @posts.save
			redirect_to posts_path, :notice => "Posts guardado"
		else
			@errors = @posts.errors.full_messages
      render :new	
		end	
	end

	# def edit
	# 	@posts = Post.new(params[:id])		
	# end		

	private
		def post_params
			params.require(:post).permit(:title,:body).merge(user_id: current_user.id)
		end
end
