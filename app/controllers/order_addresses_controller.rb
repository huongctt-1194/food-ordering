class OrderAddressesController < ApplicationController
  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = current_user.order_addresses.build(address_params)
    if @order_address.save
      if params[:order_address][:is_using]
        current_user.add_using_address(@order_address)
      end
      flash[:notice] = t 'flash.address.success'
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def address_params
    params.require(:order_address).permit :address
  end
end
