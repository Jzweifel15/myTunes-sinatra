class UsersController < ApplicationController

    get '/signin' do 
        erb :'/users/signin'
    end

end