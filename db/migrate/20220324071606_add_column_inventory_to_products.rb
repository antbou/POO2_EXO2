class AddColumnInventoryToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :inventory, :integer, :after => :description
  end
end
