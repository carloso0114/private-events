class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the app!'
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @events = Event.all
    #     @date = User.attended_events
    @time = Time.now
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username)
  end
end
