class PlaylistController < ApplicationController

    get '/index' do
        erb :'/playlists/index'
    end

end