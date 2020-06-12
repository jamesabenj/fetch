class AddImagesToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :images, :string
  end
end
