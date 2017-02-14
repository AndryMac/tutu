class Carriage < ApplicationRecord
  validates :type,:number_top_place, :number_bottom_place,  presence: true
  belongs_to :train
end
