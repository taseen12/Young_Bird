class AddColumnToPackage < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :code, :string
  end
end
