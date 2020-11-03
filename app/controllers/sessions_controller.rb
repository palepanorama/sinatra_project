class SessionsController < ApplicationController 
    get '/login' do 
        erb :'/sessions/login'
    end 

    post "/login" do
        @user = User.find_by(username: params[:username])
        binding.pry 
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect "/instruments"
        else
          erb :error 
        end
    end

    get '/logout' do 
        session.clear 
        redirect '/'
    end 
end 