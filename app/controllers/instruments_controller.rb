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


  get "/instruments/:id" do
    @instruments = Instrument.find_by(id: params[:id])
    if @instruments 
      erb :'instruments/show'
    else 
      redirect '/instruments'
    end 
  end

  get "/instruments/:id/edit" do
    if logged_in?
        @instrument = current_user.instruments.find_by(params)
        if @instrument
            erb :'instruments/edit'
        else
            redirect '/instruments'
        end
    else
        redirect '/login'
    end
       
end

  patch "/instruments/:id" do
    redirect "/instruments/:id"
  end

  delete "/instruments/:id/delete" do
    redirect "/instruments"
  end

end
