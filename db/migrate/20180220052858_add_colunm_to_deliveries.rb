class AddColunmToDeliveries < ActiveRecord::Migration[5.1]
  def change
    add_column :deliveries, :cal_comission, :string
  end
end
