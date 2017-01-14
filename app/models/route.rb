class Route < ApplicationRecord
 # has_and_belongs_to_many :railway_stations
 has_many :railway_stations_routes
 has_many :railway_stations, through: :railway_stations_routes

 validates :name, presence: true
end