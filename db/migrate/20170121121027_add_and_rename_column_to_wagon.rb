class AddAndRenameColumnToWagon < ActiveRecord::Migration[5.0]
  def change
    rename_column :wagons, :wagon_type, :number
    rename_column :wagons, :lower_seats, :bottom_seats

    add_column :wagons, :side_top_seats, :integer
    add_column :wagons, :side_bottom_seats, :integer
    add_column :wagons, :sitting_seats, :integer
  end
end
