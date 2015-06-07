class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :image
      t.integer :price
      t.integer :merchant_id

      t.timestamps null: false
    end
  end
end
