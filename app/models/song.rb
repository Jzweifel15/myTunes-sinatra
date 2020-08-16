class Song < ActiveRecord::Base[5.2]
    belongs_to :playlist
    has_many :users, through: :playlist
end