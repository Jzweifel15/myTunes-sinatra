class UserController < ApplicationController

    get '/index' do
        @playlists = Playlist.all
        erb :'user/index'
    end

    get '/logout' do 
        session.clear
        redirect '/signin'
    end

end