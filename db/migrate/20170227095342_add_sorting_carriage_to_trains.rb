class AddSortingCarriageToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :sorting_carriage, :boolean
  end
end
