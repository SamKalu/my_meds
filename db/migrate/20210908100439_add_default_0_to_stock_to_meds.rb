class AddDefault0ToStockToMeds < ActiveRecord::Migration[6.1]
  def change
    change_column :meds, :stock, :integer, default: 0
  end
end
