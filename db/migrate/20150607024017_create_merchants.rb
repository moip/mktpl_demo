class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :moip_token
      t.string :moip_id

      t.timestamps null: false
    end
  end
end
