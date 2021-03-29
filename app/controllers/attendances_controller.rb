class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.create(event_id: params[:event_id], user_id: current_user.id)
    redirect_to event_path if @attendance.save
  end

  private

  # Only allow a list of trusted parameters through.
  def attendance_params
    params.require(:attendances).permit(:user_id, :event_id)
  end
end
