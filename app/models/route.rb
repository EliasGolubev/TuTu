class Route < ApplicationRecord
 # has_and_belongs_to_many :railway_stations
 has_many :railway_stations_routes
 has_many :railway_stations, through: :railway_stations_routes
 has_many :trains

 validates :name, presence: true

 before_validation :set_name


  private
  
  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end
end