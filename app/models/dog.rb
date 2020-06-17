class Dog < ApplicationRecord
    has_many :favorites
    has_many :followers, through: :favorites
    belongs_to :user
    belongs_to :breed
    mount_uploaders :images, FileUploader
    serialize :images, JSON
    validates_presence_of :name
    validates_presence_of :bio


    
    def formatted_img_urls
        img_urls = []
        self.images.each do |image|
            new_url = image.url.gsub("%5B%22", "").gsub("%22%5D", "")
            img_urls << new_url
        end
        img_urls
    end 

    def self.search(search)
        if search 
            search.capitalize!
            breed = Breed.find_by(name: search)
            if breed
                self.where(breed_id: breed)
            else 
                Dog.all
            end 
        else
            Dog.all
        end
    end 
end
