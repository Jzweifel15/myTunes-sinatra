class UsersController < ApplicationController

    get '/signin' do 
        erb :'/users/signin'
    end

    post '/signin' do 
        user = User.find_by(username: params[:username], password: params[:password])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect '/index'
        else
            redirect '/signin'
        end
    end

    get '/signup' do 
        erb :'/users/signup'
    end

    get '/index' do 

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