class UsersController < ApplicationController 

    get '/login' do 
        erb :'users/login'
    end 

    post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect '/instruments'
        else 
            redirect '/error'
        end 
    end 

    get '/signup' do 
        erb :'users/signup'
    end 

    post '/signup' do 
        @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
        if @user.username != "" && @user.save 
            redirect '/login'
        else 
            redirect 'error'
        end
    end 

    get '/error' do 
        erb :error 
    end 

end 
