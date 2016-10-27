class EventsController < ApplicationController
  def index
    @events = Event.where('starts_at >= ?', DateTime.current)
  end

  def show
    @event = Event.find(params[:id])
  end
end
