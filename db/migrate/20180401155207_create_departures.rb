class CreateDepartures < ActiveRecord::Migration[5.1]
  def change
    create_table :departures do |t|
      t.datetime :time_stamp
      t.string :origin
      t.string :trip
      t.string :destination
      t.datetime :scheduled_time
      t.integer :lateness
      t.string :track
      t.string :status

      t.timestamps
    end
  end
end
