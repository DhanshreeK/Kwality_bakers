class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.string :invoice_no
      t.string :date
      t.string :bill_checked_by
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
