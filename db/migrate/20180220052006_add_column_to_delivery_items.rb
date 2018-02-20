class AddColumnToDeliveryItems < ActiveRecord::Migration[5.1]
  def change
    add_column :delivery_items, :qty, :string
    add_column :delivery_items, :total_amt, :string
  end
end
