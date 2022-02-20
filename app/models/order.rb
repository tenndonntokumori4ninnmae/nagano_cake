class Order < ApplicationRecord
  has_many :ordered_items
  belongs_to :customer
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
end
