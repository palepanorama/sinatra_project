class UsersController < ApplicationController 

    get "/" do
        erb :'users/welcome'
    end

    get '/signup' do 
        binding.pry 
        erb :'users/signup'
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