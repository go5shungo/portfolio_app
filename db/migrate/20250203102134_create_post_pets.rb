class CreatePostPets < ActiveRecord::Migration[6.1]
  def change
    create_table :post_pets do |t|
      t.integer :post_id, null: false
      t.integer :pet_id, null: false
      t.timestamps
    end
  end
end
