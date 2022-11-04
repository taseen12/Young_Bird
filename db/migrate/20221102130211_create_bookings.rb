class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :address
      t.string :contact_no
      t.string :email
      t.date :check_in_date
      t.date :check_out_date

      t.timestamps
    end
  end
end
