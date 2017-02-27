class Train < ApplicationRecord
  validates :number, presence: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  before_create :set_number

  private

  def set_number
    self.number = Train.all.count + 1
  end

  def count_place(type, place)
    carriages.where(type: type).sum(place)
  end

end
