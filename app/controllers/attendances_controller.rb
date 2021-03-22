class AttendancesController < ApplicationController

    def create
        a = Attendance.new(params)
        a.save
        if a.save
            redirect_to root_path
        end
        
    end
    private
    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:user_id, :event_id)
    end
end


end
