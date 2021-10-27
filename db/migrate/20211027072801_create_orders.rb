class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :order_time
      t.datetime :receive_time
      t.integer :totalprice
      t.string :address
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
