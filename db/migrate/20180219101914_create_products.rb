class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :total
      t.string :quantity

      t.timestamps
    end
  end
end
