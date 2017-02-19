# tämä rivi tarvitaan jotta api toimii herokussa ja tarvisissa
require 'beermapping_api'

class PlacesController < ApplicationController
  def index
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    session[:last_search] = params[:city]
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      render :index
    end
  end

  def show
    @place = BeermappingApi.single_place(session[:last_search], params["id"])
  end
end