class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :counts
      t.integer :categorie_id
      t.timestamps
    end
  end
end
