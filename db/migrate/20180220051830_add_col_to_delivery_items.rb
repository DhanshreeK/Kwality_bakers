class AddColToDeliveryItems < ActiveRecord::Migration[5.1]
  def change
    add_column :delivery_items, :quantity, :string
  end
end
