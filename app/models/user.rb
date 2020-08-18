class User < ActiveRecord::Base
    has_many :playlists
    has_many :songs, through: :playlists
    validates_presence_of :username, :password
    has_secure_password
end