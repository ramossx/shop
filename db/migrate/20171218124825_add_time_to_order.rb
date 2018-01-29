class AddTimeToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :oriental_at, :datetime
  end
end
