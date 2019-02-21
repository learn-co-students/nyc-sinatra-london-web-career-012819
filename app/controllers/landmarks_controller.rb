class LandmarksController < ApplicationController
  # add controller methods

  #READ index action
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end


  #CREATE new
  get '/landmarks/new' do

    erb :'landmarks/new'
  end

  #CREATE create
  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect '/landmarks'
  end

  # READ view action
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  #UPDATE edit
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  #UPDATE update
  patch '/landmarks/:id' do
    params.delete("_method")
    @landmark = Landmark.find(params[:id])
    # @landmark.name = params[:landmark][:name]
    # @landmark.year_completed = params[:landmark][:year_completed]
    # @landmark.save
    @landmark.update(name: params[:landmark][:name])
    @landmark.update(year_completed: params[:landmark][:year_completed])
    redirect "/landmarks/#{@landmark.id}"
  end
end
