class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :wagons
  has_many :tickets

  def order_wagons
    order_wagons_flag ? wagons.at_first : wagons.from_end
  end
end
