class AddColToDeliveries < ActiveRecord::Migration[5.1]
  def change
    add_column :deliveries, :total, :string
  end
end
