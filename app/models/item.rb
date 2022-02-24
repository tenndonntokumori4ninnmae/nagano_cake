class Item < ApplicationRecord

  has_one_attached :image_id

  has_many:cart_items,dependent: :destroy
  has_many:ordered_items,dependent: :destroy
  belongs_to :genre

# 税込み計算
  def add_tax_price
    (self.price*1.08).round
  end

  def get_image
    unless image_id.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image_id.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image_id
  end

  def self.search_for(content)
      Item.where('name LIKE ?', '%' + content + '%')
  end
end