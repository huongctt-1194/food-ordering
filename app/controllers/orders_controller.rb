class OrdersController < ApplicationController
  before_action :find_order, only: [:edit, :show, :update]

  def show
  end

  def edit
    @order_address = OrderAddress.new
  end

  def update
    if @order.update(order_params)
      flash[:notice] = t('flash.order.success')
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  private

  def find_order
    @order = current_user.orders.find_by status: :init
  end

  def order_params
    params.require(:order).permit(:address, :status, :order_time)
  end
end
