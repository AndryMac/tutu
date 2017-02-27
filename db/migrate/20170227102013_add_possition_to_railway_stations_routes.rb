class AddPossitionToRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :possition, :integer
  end
end
