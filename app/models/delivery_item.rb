class DeliveryItem < ApplicationRecord
  belongs_to :delivery
  belongs_to :product, optional:true
  belongs_to :inward_module
end


