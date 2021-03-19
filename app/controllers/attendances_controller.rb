class AttendancesController < ApplicationController
    def create
      @attendance = Attendance.new(attendance_params)
      @attendance.attendee_id = current_user.id
       respond_to do |format|
    #     if Attendance.where('attendee_id = ? AND attended_event_id = ?', @attendance.attendee_id,
    #                              @attendance.attended_event_id).exists?
    #       format.html do
    #         redirect_to event_path(@attendance.attended_event_id), alert: "You're already attending this event."
    #       end
    #       format.json { render json: @attendance.errors, status: :unprocessable_entity }
    #     els
        if @attendance.save
          format.html do
            redirect_to event_path(@attendance.attended_event_id), notice: 'Attendance was successfully confirmed.'
          end
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :show, status: :unprocessable_entity }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
  
    def attendance_params
      params.require(:attendance).permit(:attended_event_id)
    end
  end