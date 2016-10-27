class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def buy
    ticket_types = Event.find(params[:event_id]).ticket_types
    quantities = params[:quantities].reject{|ticket_id, quantity| quantity.to_i == 0}
    if quantities.count == 0
      redirect_to :back
    else
      quantities.each do |ticket_id, quantity|
        ticket = TicketType.find(ticket_id)
        num_remain = ticket.max_quantity
        if num_remain < quantity.to_i
          flash[:warning] = "Sorry, only #{ num_remain } #{ ticket.name } #{ 'ticket'.pluralize(num_remain)} available"
          redirect_to :back
        end
      end
    end
    quantities.each { |ticket_id, quantity| TicketType.find(ticket_id).subtract(quantity.to_i) }
    redirect_to :back
  end
end
