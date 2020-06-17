class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :dog_id
      t.integer :follower_id

      t.timestamps
    end
  end
end
