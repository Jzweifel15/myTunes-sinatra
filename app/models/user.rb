class User < ActiveRecord::Base[5.2]
    has_many :playlists
    has_many :songs, through: :playlists
    has_secure_password
end