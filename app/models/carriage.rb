class Carriage < ApplicationRecord
  validates :type_wagon, :number_top_place, :number_bottom_place,  presence: true
  belongs_to :train
end
