class Favorite < ApplicationRecord
    belongs_to :follower
    belongs_to :dog
end
