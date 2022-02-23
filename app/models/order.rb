class Order < ApplicationRecord
  has_many :ordered_items,dependent: :destroy
  belongs_to :customer

  validates :payment_method,:postal_code,:address,:name, 
             presence: true
  validates :postal_code, length: {is: 7}, numericality: {only_integer: true}

  enum payment_method: { credit_card: 0, transfer: 1 }

end
