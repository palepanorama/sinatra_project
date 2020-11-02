class InstrumentsController < ApplicationController

  get "/instruments" do

  end

  get "/instruments/new" do
    if logged_in? 
      erb :'instruments/new'
    else 
      redirect 'login'
    end 
  end

  post "/instruments" do

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
