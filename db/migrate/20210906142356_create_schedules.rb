class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.text :times, array: true, default: []
      t.text :weekdays, array: true, default: []
      t.integer :status, default: 1
      t.references :med, null: false, foreign_key: true
      t.references :treatment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
