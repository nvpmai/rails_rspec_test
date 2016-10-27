class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types, dependent: :destroy

  validates_presence_of :extended_html_description, :venue, :category, :starts_at, :name, :ticket_types
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.search(query)
    where('name ilike ?', "%#{query}%")
  end

end
