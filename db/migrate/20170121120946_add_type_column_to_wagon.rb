class AddTypeColumnToWagon < ActiveRecord::Migration[5.0]
  def change
    add_column :wagons, :type, :string
  end
end
