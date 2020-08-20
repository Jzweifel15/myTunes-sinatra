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

    get '/show/:id' do
        @playlist = Playlist.find_by("id")
        @songs = []

        @playlist.song_id.split(/\W/).each do |id|
            if id != ""
                @songs.push(id.to_i)
            end
        end

        binding.pry

        erb :'/user/show'
    end

    get '/logout' do 
        session.clear
        redirect '/signin'
    end

end