class UsersController < ApplicationController

    get '/signin' do 
        erb :'/users/signin'
    end

    post '/signin' do 
        user = User.find_by(username: params[:username], password: params[:password])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect 'playlists/index'
        else
            redirect '/signin'
        end
    end

    get '/signup' do 
        erb :'/users/signup'
    end

    post '/signup' do 
        user = User.create(email: params[:email], username: params[:username], password: params[:password])

        if user.save
            session[:user_id] = user.id
            redirect 'playlists/index'
        end
    end

    get '/logout' do 
        session.clear
        redirect '/signin'
    end

    helpers do 

        def logged_in?
            !!session[:user_id]
        end

        def current_user
            User.find(session[:user_id])
        end

    end

end