class CreateInwardModules < ActiveRecord::Migration[5.1]
  def change
    create_table :inward_modules do |t|
      t.date :date
      t.string :inward_number
      t.string :quantity
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
