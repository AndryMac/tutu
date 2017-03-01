class RailwayStation < ApplicationRecord
  validates :title, presence: true
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  scope :ordered, -> {select('railway_stations.*, railway_stations_routes.possition')
                      .joins(:railway_stations_routes)
                      .order('railway_stations_routes.possition').distinct
  }

  def update_position(route, params)
    station_route = station_route(route)
    station_route.update(possition: params[:possition]) if station_route
  end

  def position_in(route)
    station_route(route).try(:possition)
  end

  protected
  def station_route(route)
    @station_route = railway_stations_routes.where(route: route).first
  end

end
