class OrderedItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum status: { no: 0, craft_wait: 1, in_crafting: 2, complete: 3 }
end
