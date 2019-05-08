# frozen_string_literal: true

class LandmarksController < ApplicationController
  get "/landmarks" do # index
    erb :'landmarks/index'
  end

  get "/landmarks/new" do # new aciton
    erb :'/landmarks/new'
  end

  post "/landmarks" do # create action
    Landmark.create(
      name: params[:landmark][:name],
      year_completed: params[:landmark][:year_completed]
    )
  end

  get "/landmarks/:id" do # show action
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get "/landmarks/:id/edit" do # edit action
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch "/landmarks/:id/edit" do # update action
    landmark = Landmark.find(params[:id])
    landmark.update(
      name: params[:landmark][:name],
      year_completed: params[:landmark][:year_completed]
    )
    redirect "landmarks/#{landmark.id}"
  end
end
