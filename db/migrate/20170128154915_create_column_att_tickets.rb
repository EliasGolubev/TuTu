class CreateColumnAttTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :column_att_tickets do |t|
      add_column :tickets, :fullname, :string
      add_column :tickets, :passport_number, :string
    end
  end
end
