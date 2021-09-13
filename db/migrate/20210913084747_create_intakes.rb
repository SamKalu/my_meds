class CreateIntakes < ActiveRecord::Migration[6.1]
  def change
    create_table :intakes do |t|
      t.datetime :due_date
      t.boolean :taken, default: false
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
