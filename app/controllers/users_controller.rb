class UsersController < ApplicationController
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
    @user = User.find(params[:id])
    @favorite_posts = @user.favorites.includes(favoritable: :user).where(favoritable_type: 'Post').map(&:favoritable)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  
end
