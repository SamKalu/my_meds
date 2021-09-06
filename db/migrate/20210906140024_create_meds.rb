class CreateMeds < ActiveRecord::Migration[6.1]
  def change
    create_table :meds do |t|
      t.string :name
      t.string :description
      t.integer :stock
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
