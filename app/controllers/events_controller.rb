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

  def new
    @event = Event.new
    @venues = Venue.all
    @categories = Category.all
    3.times { ticket_type = @event.ticket_types.build }
  end

  private 
  def event_params
    params.require(:event).permit(:name, :category_id, :venue_id, :starts_at, :ends_at, 
  		:hero_image_url, :extended_html_description, ticket_types_attributes: [:name, :price, :max_quantity])
  end
end
