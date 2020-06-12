class DropDogAttachments < ActiveRecord::Migration[6.0]
  def change
    drop_table :dog_attachments
  end
end
