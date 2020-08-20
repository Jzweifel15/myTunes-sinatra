class UserController < ApplicationController

    get '/index' do
        @playlists = Playlist.all
        erb :'/user/index'
    end

    post '/index' do 
        #Playlist.create(params[:name], params[:song_id])
        user = User.find_by("id")
        songs = []
        params[:song_id].each do |id|
            songs.push(id)
        end
        Playlist.create(name: params[:name], user_id: user.id, song_id: songs)
        redirect '/index'
    end

    get '/new' do 
        @songs = Song.all
        erb :'/user/new'
    end

    get '/index/:id' do
        @playlist = Playlist.find_by("id")
        @songs = []

        @playlist.song_id.split(/\W/).each do |id|
            if id != ""
                song = Song.find_by(id: id)
                @songs.push(song)
            end
        end

        erb :'/user/show'
    end

    delete '/index/:id' do 
        playlist = Playlist.find_by("id")
        playlist.destroy

        redirect '/index'
    end

    get '/logout' do 
        session.clear
        redirect '/signin'
    end

end