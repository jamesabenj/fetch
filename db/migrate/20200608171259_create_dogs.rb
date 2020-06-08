class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.text :bio
      t.boolean :adopted
      t.string :breed
      t.text :image
      t.timestamps
    end
  end
end
