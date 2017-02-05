class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def create
    @first_station = RailwayStation.find(params[:first_station][:railway_station_id])
    @last_station = RailwayStation.find(params[:last_station][:railway_station_id])

    @trains = Search.train_on_route(@first_station, @last_station)

    render :search_result
  end 
end