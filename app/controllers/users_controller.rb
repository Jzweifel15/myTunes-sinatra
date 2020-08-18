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

    get '/index' do 
        
    end

end