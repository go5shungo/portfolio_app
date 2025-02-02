class CreateUserPets < ActiveRecord::Migration[6.1]
  def change
    create_table :user_pets do |t|
      t.integer :user_id, null: false
      t.integer :pet_id, null: false

      t.timestamps
    end
  end
end
