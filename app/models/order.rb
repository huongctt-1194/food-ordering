class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  def sum
    self.totalprice = OrderItem.joins(:food).where(order_items: {order_id: self.id}).sum('order_items.quantity * foods.price')
    self.save
  end
end
