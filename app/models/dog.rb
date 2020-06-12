class Dog < ApplicationRecord
    #belongs_to :user
    mount_uploaders :images, FileUploader
    validates :name, presence: true
    validates :bio, presence: true 
    validates :breed, presence: true 
end
