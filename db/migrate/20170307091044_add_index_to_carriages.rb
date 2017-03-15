class AddIndexToCarriages < ActiveRecord::Migration[5.0]
  def change
    add_index :carriages, %i[number train_id], unique: true
  end
end
