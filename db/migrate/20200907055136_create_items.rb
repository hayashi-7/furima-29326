class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.timestamps
      t.text :text, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :price, null: false
      t.string :name, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :shipping_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :day_id, null: false
      t.boolean :sold
    end
  end
end
