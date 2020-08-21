# MyTunes-Sinatra
MyTunes is a small playlist creator MVC web-application using the Sinatra library. This app utilizes RESTful route naming patterns and ActiveRecord for making CRUD (Create, Read, Update, Destroy) actions to a database. 

## Usage
```ruby
class User < ActiveRecord::Base # The User model is anyone who signs up
    has_many :playlists     # A user can have as many playlists as they choose to create
    has_many :songs, through: :playlists    # A user will technically have many songs, but through the playlists created
    has_secure_password     # A user's password will be encrypted and salted using the Bcrypt Gem
end

class Playlist < ActiveRecord::Base # The Playlist model can store Songs and is created by a User
    has_many :songs     # A playlist can store as many songs a user decides to put into it
    belongs_to :user    # A playlist belongs to specific users using primary and foreign keys from the database
    validates :name, presence: true # A playlist must have a name to be created and stored in the database
end

class Song < ActiveRecord::Base # The Song model that sets up different song objects and can be stored in a Playlist
    belongs_to :playlist    # A song belongs to playlist, but multiple playlists can have the same songs
    has_many :users, through: :playlist # A song has many Users, but only through a User's playlists
end
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)