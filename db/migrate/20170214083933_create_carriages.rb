class CreateCarriages < ActiveRecord::Migration[5.0]
  def change
    create_table :carriages do |t|

      t.string :type
      t.integer :number_top_place
      t.integer :number_bottom_place

    end
  end
end
