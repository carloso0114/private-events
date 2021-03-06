class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update]
  before_action :logged_in_user, only: %i[new show]

  # GET /events or /events.json
  def index
    @events = Event.all
    @time = Time.now
  end

  # GET /events/1 or /events/1.json
  def show
    @user = User.all
    @event = Event.find(params[:id])
    @attendances = Attendance.all
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events or /events.json
  def create
    @event = current_user.created_events.build(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:date, :location, :description, :creator_id)
  end
end
