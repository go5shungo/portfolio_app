class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile_images = @user.profile_image
    @posts = current_user.posts
  end
  
  def edit
    @user = User.find(params[:id])
  end
end
