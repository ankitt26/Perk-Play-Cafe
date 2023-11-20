class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :landmark
      t.string :street
      t.string :city
      t.integer :pincode
      t.string :state
      t.string :country
      t.integer :phone
      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
