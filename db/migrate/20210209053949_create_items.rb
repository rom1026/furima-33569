class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,         null: false, default: ""
      t.text :product_details,        null: false
      t.integer :category_id,         null: false
      t.integer :product_status_id,   null: false
      t.integer :shipping_charges_id, null: false
      t.integer :prefecture_id,       null: false
      t.integer :days_to_ship_id,     null: false
      t.integer :selling_price,       null: false
      t.references :user,             foreign_key: true


      t.timestamps
    end
  end
end
