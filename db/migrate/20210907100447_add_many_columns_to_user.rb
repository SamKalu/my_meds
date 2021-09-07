class AddManyColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :blood_type, :string
    add_column :users, :birthday, :date
  end
end
