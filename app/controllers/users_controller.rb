class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @profile_images = @user.profile_image
    @posts = @user.posts.page(params[:page]).per(9)
    @pets = @user.pets
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def favorites
    @user = User.find(params[:user_id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = @user.favorites.includes(:post).map(&:post)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path
    end
  end

end
