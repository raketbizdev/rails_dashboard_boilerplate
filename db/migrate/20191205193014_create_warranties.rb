class CreateWarranties < ActiveRecord::Migration[5.2]
  def change
    create_table :warranties do |t|
      t.string :product_id
      t.string :product_serial_number
      t.integer :client_id
      t.integer :agent_id
      t.integer :distributor_id
      t.date :sale_date
      t.date :start_time
      t.date :expiry_date

      t.timestamps
    end
  end
end
