class Follower < ApplicationRecord
    has_many :favorites
    has_many :dogs, through: :favorites
end
