class AddIndexToAttendandes < ActiveRecord::Migration[6.1]
  def change
    add_index :attendances, :attendee
    add_index :attendances, :attended_event
  end
end
