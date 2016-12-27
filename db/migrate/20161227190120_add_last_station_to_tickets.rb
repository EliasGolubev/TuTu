class AddLastStationToTickets < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :tickets, :last_station
  end
end
