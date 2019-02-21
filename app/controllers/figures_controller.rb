class FiguresController < ApplicationController
  # add controller methods

  #READ ALL
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  #CREATE
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  #CREATE
  post '/figures' do
    @figure = Figure.create(params['figure'])

    if !params['title']['name'].empty? #returns true if empty, false if not empty
      @figure.titles << Title.create(params[:title])
    end

    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save

    redirect "figures/#{@figure.id}"
  end

  #READ SINGULAR
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params["id"])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  #UPDATE update
  patch '/figures/:id' do
    params.delete("_method")
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])

    if !params['title']['name'].empty? #returns true if empty, false if not empty
      @figure.titles << Title.create(params[:title])
    end

    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params[:landmark][:name])
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end


end
