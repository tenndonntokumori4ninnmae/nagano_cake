class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :show
    end
  end

  def quit
  end

  def out
    @customer = current_customer
    # is_deletedカラムにフラグを立てる
    @customer.update(is_deleted: true)
    # ログアウトさせる
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postcode, :address, :phonenumber, :email)
  end

end
