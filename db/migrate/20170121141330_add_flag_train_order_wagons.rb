class AddFlagTrainOrderWagons < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :order_wagons_flag, :boolean
  end
end
