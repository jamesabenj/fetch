class ChangeImageColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :dogs, :image, :string
  end
end
