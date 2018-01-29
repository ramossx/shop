class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :counts
      t.boolean :stats

      t.timestamps
    end
  end
end
