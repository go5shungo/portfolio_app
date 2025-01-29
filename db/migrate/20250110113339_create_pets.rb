class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.integer :user_id, null: false
      t.string  :name, null: false
      t.integer :kind, null: false
      t.date    :birthday
      t.boolean :sex
      t.text    :introduction

      t.timestamps
    end
  end

end