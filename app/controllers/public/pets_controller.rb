class Public::PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def index
    @pets = current_user.pets
  end

  def show
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


  private
  def pet_params
    params.require(:pet).permit(:image, :name, :kind, :birthday, :sex, :introduction).tap do |whitelisted|
      whitelisted[:kind] = params[:pet][:kind].to_i
      
  end
end
end
