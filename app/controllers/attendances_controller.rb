class AttendancesController < ApplicationController
  
  def new
  @attendance= Attendance.new
  end

  def create
    @attendance = current_user.attended_events.build(attendance_params)
    respond_to do |format|
      if @attendance.save
        format.html { redirect_to root_path, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:attendees, :attended_events)
    end
end
