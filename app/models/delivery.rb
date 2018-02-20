class Delivery < ApplicationRecord
  belongs_to :vendor
  has_many :delivery_items, inverse_of: :delivery, dependent: :destroy
  accepts_nested_attributes_for :delivery_items, reject_if: :all_blank, allow_destroy: true, :update_only => true
  scope :load, ->(id) { where(id: id).take }
  def self.set_invoice_no
    date = Date.today.strftime('%d')
    if Delivery.first.nil?
      'IN' + date.to_s + '1'
    else
      last_id = Delivery.last.id.next
      'IN' + date.to_s + last_id.to_s
    end
  end
end
