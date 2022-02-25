class AddFamilyNameToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :family_name, :string
  end
end
