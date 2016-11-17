class UsersController < ApplicationController
	def show
		@user = User.find(current_user)
		@posts = @user.posts
	end
end
