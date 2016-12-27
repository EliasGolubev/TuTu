class RailwayStation < ApplicationRecord
  has_and_belongs_to_many :routes
  has_many :trains, foreign_key: :current_station_id
  has_many :tickets, foreign_key: :first_station_id
end
