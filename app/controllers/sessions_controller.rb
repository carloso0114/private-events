class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    # if user && user.authenticate(params[:session][:password])
    if user && user.authenticate(params[:session])
      log_in user
      redirect_back_or user
    else
      # flash.now[:danger] = 'Invalid email/password combination'
      flash.now[:danger] = 'Invalid username'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end