class InwardModule < ApplicationRecord
  belongs_to :product
  after_save :create_product_detail

  def create_product_detail
  	ProductDetail.create!(inward_module_id: self.id, date: self.date , inward_number: self.inward_number, quantity: self.quantity, product_id: self.product_id)
  end
end
