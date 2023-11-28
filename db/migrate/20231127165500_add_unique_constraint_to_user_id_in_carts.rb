class AddUniqueConstraintToUserIdInCarts < ActiveRecord::Migration[7.0]
  def change
    remove_index :carts, :user_id

    add_index :carts, :user_id, unique: true
  end
end
