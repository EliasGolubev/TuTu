class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.string :wagon_type
      t.integer :top_seats
      t.integer :lower_seats
    end
  end
end
