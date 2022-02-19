class Admin::CustomersController < ApplicationController
  def index
    @customers=Customer.page(params[:page]).per(5)
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer=Customer.find(params[:id])
  end
  
  def update
    @customer=Customer.find(params[:id])
      if @customer.update(customer_params)
        redirect_to admin_customer_path(@customer)
      else
        render "edit"
      end
  end
  
  def customer_params
    params.require(:customer).permit(:family_name,:first_name,:family_name_kana,:first_name_kana,:postcode,:address,:phonenumber,:email,:is_deleted)
  end
  
end
