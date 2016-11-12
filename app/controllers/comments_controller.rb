class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		@comment.user_id = current_user.id if current_user
		@comment.save

		if @comment.save
			flash[:notice] = "Comment was successfully created"
			redirect_to post_path(@post)
		else
			render :action => :new
		end
	end

	def edit
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

	def update
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])

		if @comment.update(comment_params)
			flash[:notice] = "Comment was successfully updated"
			redirect_to post_path(@post)
		else
			render :action => :edit
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		flash[:alert] = "Comment was successfully deleted"
		redirect_to post_path(@post)
	end
	private

	def comment_params
		params[:comment].permit(:comment)
	end

end

