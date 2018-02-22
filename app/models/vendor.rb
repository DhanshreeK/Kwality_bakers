class Vendor < ApplicationRecord
		scope :load, ->(id) { where(id: id).take }
		has_many :deliveries
end