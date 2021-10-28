class OrderItem < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :food
  before_save :sum

  def sum
    @order = Order.find_by id: self.order_id
    @order.sum
  end
end
