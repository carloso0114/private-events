class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def logged_in_user
    store_location if logged_in? == false
    flash[:danger] = 'Please log in.' if logged_in? == false
    redirect_to login_url if logged_in? == false
  end
end
