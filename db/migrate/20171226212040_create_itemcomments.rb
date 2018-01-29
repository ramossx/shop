class CreateItemcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :itemcomments do |t|
      t.integer :user_id
      t.integer :item_id
      t.string :text


      t.timestamps
    end
  end
end
