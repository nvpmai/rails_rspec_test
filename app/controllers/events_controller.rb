class EventsController < ApplicationController
  def index
    @events = Event.where('starts_at >= ?', DateTime.current)
    if params[:search]
      @events = Event.search(params[:search])
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
