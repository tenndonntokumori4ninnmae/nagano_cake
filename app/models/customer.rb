class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  
  # 退会ユーザーはログインできなくする
  def active_for_authentication?
    super && (self.is_deleted == false)
  end 

  validates :address,presence: true
  validates :family_name,presence: true
  validates :first_name,presence: true
  validates :family_name_kana,presence: true
  validates :first_name_kana,presence: true
  validates :postcode, length: {is: 7}, numericality: {only_integer: true}
  validates :phonenumber, length: {in: 10..11}, numericality: {only_integer: true}


end
