class AddIndexToRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    add_index :railway_stations_routes, [:railway_station_id, :route_id], :name => 'index_stations_routes'
  end
end
