class UserController < ApplicationController

    get '/index' do
        @playlists = Playlist.all
        erb :'/user/index'
    end

    post '/index' do 
        Playlist.create(params[:name], params[:song_id])
        redirect '/index'
    end

    get '/new' do 
        @songs = Song.all
        erb :'/user/new'
    end

    get '/logout' do 
        session.clear
        redirect '/signin'
    end

end