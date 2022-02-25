class Order < ApplicationRecord
  has_many :ordered_items,dependent: :destroy
  belongs_to :customer

  validates :postal_code, length: {is: 7}, numericality: {only_integer: true}


  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { wait: 0, confirm: 1, crafting: 2, preparation: 3, complete: 4 }
end
