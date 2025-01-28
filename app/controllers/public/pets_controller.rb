class Public::PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    pet = Pet.new(pet_params)
    pet.user_id = current_user.id
    pet.save
    redirect_to pet_path(pet.id)
  end

end
