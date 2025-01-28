class CreatePets < ActiveRecord::Migration[6.1]
  def change
    unless table_exists?(:pets)
    create_table :pets do |t|
      t.integer :user_id, null: false
      t.boolean :sex
      t.date    :birthday
      t.string  :name, null: false
      t.text    :introduction

      t.timestamps
    end
  end
end
def table_exists?(table_name)
  ActiveRecord::Base.connection.table_exists?(table_name)
end
end