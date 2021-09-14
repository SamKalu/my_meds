class AddCarerToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :carer, foreign_key: { to_table: :users }
  end
end
