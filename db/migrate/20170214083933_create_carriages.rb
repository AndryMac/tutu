class CreateCarriages < ActiveRecord::Migration[5.0]
  def change
    create_table :carriages do |t|

      t.integer :number
      t.string :type_wagon
      t.integer :number_top_place, default: 0
      t.integer :number_bottom_place, default: 0
      t.integer :number_side_bottom_place, default: 0
      t.integer :number_side_top_place, default: 0
      t.integer :number_seat_place, default: 0
      t.belongs_to :train

      t.timestamps
    end
  end
end
