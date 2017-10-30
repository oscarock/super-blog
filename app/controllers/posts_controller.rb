class PostsController < ApplicationController
	def index
		@posts = Post.order('created_at ASC')
	end

	def new
		@posts = Post.new
		@title = 'Registrar Posts'	
	end

	def create
		@posts = Post.new(post_params)
		if @posts.save
			redirect_to posts_path, :notice => "Posts guardado correctamente"
		else
			@errors = @posts.errors.full_messages
      render :new	
		end	
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	def edit
		@posts = Post.find(params[:id])
		@title = 'Editar Posts'	
	end

	def update
		@posts = Post.find(params[:id])
		if @posts.update(post_params)
			redirect_to posts_path, :notice => "Post Editado correctamente"
		else
			@errors = @posts.errors.full_messages
			render :edit
		end		
	end

	def destroy
		post = Post.find(params[:id])
		post.destroy

		redirect_to posts_path, :alert => "Post eliminado correctamente"	 
	end	

	private
		def post_params
			params.require(:post).permit(:title,:body).merge(user_id: current_user.id)
		end
end
