class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.timestamps
      t.string :postal_code, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.integer :prefecture_id, null: false
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
    end
  end
end
