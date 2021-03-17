class AddAttendeeToAttendance < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :attendee, :integer
    add_column :attendances, :attended_event, :integer
  end
end
