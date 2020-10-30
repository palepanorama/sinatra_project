class UsersController < ApplicationController 

    get '/signup' do 
        erb :'users/signup'
    end 

    post '/signup' do 
        @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
        if @user 
            @user.save 
            session[:user_id] = @user.id 
            redirect '/login'
        else 
            redirect '/error'
        end 
    end 

    get '/error' do 
        erb :error 
    end 

end 
