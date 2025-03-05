class Public::PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def index
    @user = User.find(params[:user_id])  
    @pets = @user.pets
  end

  def show
    @pet = Pet.find(params[:id])  
  end

  def edit
    @pet = Pet.find(params[:id])  
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    if @pet.save
    redirect_to pet_path(@pet.id)
    else
      render :new
    end
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy
    redirect_to user_path(current_user)
  end


  private
  def pet_params
    params.require(:pet).permit(:image, :name, :kind, :birthday, :sex, :introduction)
end
end
