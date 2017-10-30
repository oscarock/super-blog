class CommentsController < ApplicationController
	def create
		post = Post.find(params[:post_id])
		@comment = post.comment.new(comment_params)
		if @comment.save
			redirect_to post_path(post), :notice => "Comentario guardado correctamente"
		else
			redirect_to post_path(post), :alert => @comment.errors.full_messages.join(' ')
		end
	end

	def destroy
		post = Post.find(params[:post_id])
		comment = post.comment.find(params[:id])
		comment.destroy
		
		redirect_to post_path(post), :alert => "Comentario eliminado correctamente"
	end

	private
    def comment_params
      params.require(:comment).permit(:body).merge(user_id: current_user.id)
    end
end