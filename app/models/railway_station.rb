class RailwayStation < ApplicationRecord
  # has_and_belongs_to_many :routes
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  has_many :trains, foreign_key: :current_station_id

  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.position').uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def update_time(route, arrival_time, departure_time)
    station_route = station_route(route)
    if station_route
      station_route.arrival = arrival_time
      station_route.departure = departure_time
      station_route.save
    end
  end

  def time_arival_now(route)
    time = station_route(route).try(:arrival)
    time.to_s(:time) if time
  end

  def time_departure_now(route)
    time = station_route(route).try(:departure)
    time.to_s(:time) if time
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
