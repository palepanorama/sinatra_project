class InstrumentsController < ApplicationController

  get "/instruments" do
    if logged_in? 
      @instruments = current_user.instruments 
      erb :'/instruments/index'
    else 
      redirect '/login'
    end 
  end

  get "/instruments/new" do
    if logged_in? 
      erb :'instruments/new'
    else 
      redirect 'login'
    end 
  end

  post "/instruments" do
    if logged_in?
      instrument = current_user.instruments.create(name: params[:name], practice_time: params[:practice_time])
      if instrument 
        redirect '/instruments/:id'
      else 
        redirect '/instruments/new'
      end 

    else 
      redirect 'login'        
    end 
  end 

  get '/instruments/:id/edit' do
    if logged_in?
        @instrument = current_user.instruments.find_by(id: params[:id])
        # binding.pry 
        erb :'instruments/edit'
    else 
        redirect '/login'
    end 
end

  get "/instruments/:id" do
    @instrument = Instrument.find_by(id: params[:id])
    if @instrument
      erb :'instruments/show'
    else 
      redirect '/instruments'
    end 
  end

  patch "/instruments/:id" do
    if logged_in? 
      instrument = current_user.instruments.find_by(id: params[:id])
      instrument.update(
        name: params[:name],
        practice_time: params[:practice_time])
        redirect '/instruments'
    else 
      redirect '/login'
    end 
  end


  delete '/instruments/:id' do
    if logged_in?
        @instruments = current_user.instruments.find_by(id: params[:id])
        if @instruments
            @instruments.destroy
        end
        redirect '/instruments'
    else
        redirect '/login'
    end
end

end 



