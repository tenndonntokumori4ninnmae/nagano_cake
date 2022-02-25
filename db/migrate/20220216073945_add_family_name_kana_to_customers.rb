class AddFamilyNameKanaToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :family_name_kana, :string
  end
end
