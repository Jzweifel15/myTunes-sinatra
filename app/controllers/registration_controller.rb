class RegistrationController < ApplicationController

    get '/signin' do 
        erb :'/registration/signin'
    end

    post '/signin' do 
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect '/index'
        else
            redirect '/signin'
        end
    end

    get '/signup' do 
        erb :'/registration/signup'
    end

    post '/signup' do 
        if params[:email].empty? || params[:username].empty? || params[:password].empty?
            @error = "All fields must be filled in before proceeding."
            erb :'/registration/signup'
        else
            @user = User.create(params)
            session[:user_id] = @user.id
            redirect '/index'
        end
    end

end