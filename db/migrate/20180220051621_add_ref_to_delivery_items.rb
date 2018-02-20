class AddRefToDeliveryItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :delivery_items, :inward_module, foreign_key: true
  end
end
