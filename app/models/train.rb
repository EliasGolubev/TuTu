class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :wagons
  has_many :tickets

  def count(seats_type=nil, type)
    count = 0
    self.wagons.each do |wagon|
      count += wagon.lower_seats if seats_type == 'lower' && wagon.wagon_type == type
      count += wagon.top_seats if seats_type == 'top' && wagon.wagon_type == type
      count += 1 if seats_type == nil && wagon.wagon_type == type
    end
    return count
  end
end
