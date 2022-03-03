class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.timestamp :created_at
      t.timestamp :shipped_at
      t.references :client
    end
  end
end
