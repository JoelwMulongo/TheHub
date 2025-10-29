class SignupsController < ApplicationController
  before_action :require_login

  def create
    event = Event.find(params[:event_id])
    signup = event.signups.build(user: current_user)
    if signup.save
      redirect_to event, notice: 'Successfully signed up!'
    else
      redirect_to event, alert: 'You have already signed up for this event.'
    end
  end
end