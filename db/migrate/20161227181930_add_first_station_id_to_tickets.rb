class AddFirstStationIdToTickets < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :tickets, :first_station
  end
end
