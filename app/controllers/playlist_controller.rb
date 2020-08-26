class PlaylistController < ApplicationController

    get '/index' do
        if logged_in?
            @user = User.find(session[:user_id])
            @user_playlists = []
            Playlist.all.each do |playlist|
                if playlist.user_id == @user.id 
                    @user_playlists.push(playlist)
                end
            end
            erb :'/playlist/index'
        else
            erb :'/playlist/error'
        end
    end

    get '/new' do 
        @songs = Song.all
        erb :'/playlist/new'
    end

    post '/index' do 
        user = User.find(session[:user_id])
        songs = []
        params[:song_id].each do |id|
            songs.push(id)
        end
        Playlist.create(name: params[:name], user_id: user.id, song_id: songs)
        redirect '/index'
    end

    get '/index/:id' do
        playlist = Playlist.find_by(id: params[:id])
        if playlist.user == current_user
            @playlist = playlist
            @playlist_songs = []

            @playlist.song_id.split(/\W/).each do |id|
                if id != ""
                    song = Song.find_by(id: id)
                    @playlist_songs.push(song)
                end
            end
            erb :'/playlist/show'
        else
            erb :'playlist/error'
        end
    end 

    get '/index/:id/edit' do
        playlist = Playlist.find_by(id: params[:id])
        if playlist.user == current_user
            @playlist = playlist
            @all_songs = Song.all
            @playlist_songs = []

            @playlist.song_id.split(/\W/).each do |id|
                if id != ""
                    song = Song.find_by(id: id)
                    @playlist_songs.push(song)
                end
            end
            erb :'/playlist/edit'
        else
            erb :'playlist/error'
        end
    end

    patch '/index/:id' do 
        @playlist = Playlist.find_by(id: params[:id])
        user = User.find(session[:user_id])
        songs = []
        params[:song_id].each do |id|
            songs.push(id)
        end
        @playlist.update(name: params[:name], user_id: user.id, song_id: songs)

        redirect '/index'
    end

    delete '/index/:id' do 
        playlist = Playlist.find_by(id: params[:id])
        playlist.delete

        redirect '/index'
    end

    get '/logout' do 
        session.clear
        redirect '/signin'
    end

end