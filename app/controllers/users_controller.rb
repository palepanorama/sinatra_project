class UsersController < ApplicationController 

    get '/signup' do 
        "yo" 
    end 

    post '/signup' do 
        user = User.new(:username => params[:username], :password => params[:password])
        if user.username != "" && user.save 
            redirect '/login'
        else 
            redirect '/error'
        end 
    end 
end 