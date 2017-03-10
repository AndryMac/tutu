class RenameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :railway_stations_routes, :possition, :position
  end
end
