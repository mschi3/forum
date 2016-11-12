class PostsController < ApplicationController
	before_action :authenticate_user!
	def index
		@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:notice] = "Post was successfully created"
			redirect_to @post
		else
			render :action => :edit
		end
	end

	def destroy
 		@post = Post.find(params[:id])
 		@post.destroy
 		flash[:alert] = "Post was successfully deleted"
 		redirect_to :action => :index
 	end

	private

	def post_params
		params.require(:post).permit(:title, :post)
	end

end
