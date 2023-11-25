class AddDeliveredColumnToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :delivered, :boolean, default: false
  end
end
