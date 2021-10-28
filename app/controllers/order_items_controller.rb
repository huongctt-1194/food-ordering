class OrderItemsController < ApplicationController
  before_action :find_order, only: :create

  def new
    @order_item = OrderItem.new
  end

  def create
    add_order_item params[:order_item][:food_id].to_i
    if @order_item.save
      flash[:notice] = t 'flash.item.success'
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:order_item).permit :quantity, :food_id
  end

  def find_order
    @order = Order.find_by user_id: current_user.id, status: 0
    return if @order.present?

    @order = current_user.orders.build()
  end

  def add_order_item food_id
    @order.order_items.each do |item|
      next unless item.food_id == food_id
      @order_item = item
      @order_item.quantity += params[:order_item][:quantity].to_i
    end
    @order_item = current_user.order_items.build(item_params)
    @order_item.order_id = @order.id
  end
end
