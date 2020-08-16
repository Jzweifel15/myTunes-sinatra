class Playlist < ActiveRecord::Base[5.2]
    has_many :songs
    belongs_to :user
end