class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  # enum status: [:init, :order, :accept, :confirm]
  enum status: { init: 0, created: 1, accepted: 2, confirm: 3 }

  def sum
    self.totalprice = OrderItem.joins(:food).where(order_items: {order_id: self.id}).sum('order_items.quantity * foods.price')
    self.save
  end
end
