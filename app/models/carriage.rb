class Carriage < ApplicationRecord
  validates :type_wagon, :number_top_place, :number_bottom_place,  presence: true
  belongs_to :train

  TYPES = {
      EconomCar: 'Плацкарт',
      CompartmentCar: 'Купе'
  }

  def self.types
    TYPES
  end

  scope :econom_car, -> {where(:type_wagon => 'Плацкарт')}
  scope :com_car, -> {where(:type_wagon => 'Купе')}

end
