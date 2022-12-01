class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :age
      t.string :contact_no
      t.string :email_id
      t.string :destination
      t.string :message

      t.timestamps
    end
  end
end
