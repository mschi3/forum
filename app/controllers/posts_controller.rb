class PostsController < ApplicationController
	before_action :authenticate_user!
	
	
	def dashboard
		@usercount=User.count(:all)
		@postcount=Post.count(:all)
		@commentcount=Comment.count(:all)
  	end
	
	def index
		@posts = Post.all
		if params[:cat]
			@category = Category.find_by_name(params[:cat])
			@posts = @category.posts
		else
			@posts = Post.all
		end

		if params[:order]
			if params[:order] == 'title'
				sort_by = "#{params[:order]}"
				@posts = Post.order(sort_by).all
			else
				sort_by = "#{params[:order]} DESC"
				@posts = Post.order(sort_by).all
			end
		end
  end

  def new
  	@post = Post.new
	end

	def create
		@post = current_user.posts.new(post_params)
		@post.user = current_user
		if @post.save
			flash[:notice] = "Post was successfully created"
			redirect_to @post
		else
			render :action => :new
		end
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
			flash[:notice] = "Post was successfully updated"
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
		params.require(:post).permit(:title, :post, category_ids: [])
	end

end
