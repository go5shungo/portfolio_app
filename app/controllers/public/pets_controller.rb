class Public::PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])  
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    @pet.save
    redirect_to pet_path(@pet.id)
  end

  


  private
  def pet_params
    params.require(:pet).permit(:image, :name, :kind, :birthday, :sex, :introduction)
  end

end
