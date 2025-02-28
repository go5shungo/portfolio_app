class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id]) 
    @post_comment = PostComment.new 
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      pets_params[:pet_ids].each do |pet_id|
        PostPet.create(post_id: @post.id, pet_id: pet_id)
      end
      flash[:notice] = "投稿に成功しました。"
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "投稿に失敗しました。" 
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)  
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/posts'
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def pets_params
    params.require(:pets).permit(pet_ids: [])
  end
end
