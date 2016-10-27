class TicketType < ActiveRecord::Base
  belongs_to :event

  def subtract(num)
    update_attributes(max_quantity: max_quantity - num)
  end
end
