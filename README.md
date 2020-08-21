# MyTunes-Sinatra
MyTunes is a small playlist creator MVC web-application using the Sinatra library. This app utilizes RESTful route naming patterns and ActiveRecord for making CRUD (Create, Read, Update, Destroy) actions to a database. 

### Installation
Fork and Clone the repository to get started tweaking and working on your own version of MyTunes!

### Models
Three models were created in `app/models`. One for a `User`, one for a `Playlist`, and one for a `Song`.

### Migrations
Overall, there were three migrations total. One migration that created a table for each model.

### Associations
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

### Seeds
A seeds file was utilized to create 'dummy' data for songs. This data is stored in the database and is listed to allow a user to choose from to create their playlist.

### User Authentication
A User can sign in or sign up using a secure password that is encrypted and salted from the Bcrypt Gem. When a user signs in/up their playlists are pulled from the database using primary and foreign keys to associate a User's playlists. 

### CRUD Actions 
A User can Create as many playlists as they want; can see/Read all their playlists on their homepage; can see/Read all the songs associated to a particular playlist; can Update a playlist by changing the name or adding new songs; or, Destroy/Delete a playlist completely, if the User chooses to. 

## License
[MIT](https://choosealicense.com/licenses/mit/)