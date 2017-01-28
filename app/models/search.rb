class Search
  def self.train_on_route(first_station, last_station)
    trains = []
    common_routes = first_station.routes & last_station.routes
    common_routes.each do |route|
      if first_station.position_in(route) < last_station.position_in(route)
        route.trains.each { |train| trains << train }
      end
    end
    trains
  end
end