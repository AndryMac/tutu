class Route < ApplicationRecord
  validates :title, presence: true
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains



  validate :stations_count
  before_validation :set_name

  private

  def set_name
    self.title = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Маршрут должн содержать как минимум 2 станции")
    end
  end

end
