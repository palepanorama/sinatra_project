class InstrumentsController < ApplicationController

  get "/instruments" do
    if logged_in? 
      @instruments = current_user.instruments 
      binding.pry 
      erb :'instruments/index'
    else 
      redirect '/error'
    end 
  end

  get "/instruments/new" do
    erb :"/instruments/new.html"
  end

  post "/instruments" do
    redirect "/instruments"
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
    erb :"/instruments/edit.html"
  end

  patch "/instruments/:id" do
    redirect "/instruments/:id"
  end

  delete "/instruments/:id/delete" do
    redirect "/instruments"
  end

end
