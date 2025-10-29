class EventsController < ApplicationController
  before_action :require_login

  def index
    @events = Event.order(date: :asc)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.organized_events.build
  end

  def create
    @event = current_user.organized_events.build(event_params)
    if @event.save
      redirect_to @event, notice: 'Event created!'
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date, resources: [])
  end
end