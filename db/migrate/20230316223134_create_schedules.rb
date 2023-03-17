class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|

      t.timestamps
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :start_time
    end
  end
end
