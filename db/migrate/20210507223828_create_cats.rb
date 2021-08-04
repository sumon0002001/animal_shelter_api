class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.string :pet_name
      t.string :pet_color
      t.integer :age
      t.timestamps
    end
  end
end
