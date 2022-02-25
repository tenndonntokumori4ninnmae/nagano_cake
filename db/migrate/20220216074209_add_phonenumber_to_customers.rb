class AddPhonenumberToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :phonenumber, :string
  end
end
