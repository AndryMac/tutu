class Carriage < ApplicationRecord
  validates :number,  :number_top_place, :number_bottom_place,  presence: true
  belongs_to :train

  before_validation :set_number

  TYPES = {
      EconomCarriage: 'Плацкарт',
      CoupeCarriage: 'Купе',
      SedentaryCarriage: 'Сидячий',
      SvCarriage: 'СВ'
  }

  def self.types
    TYPES
    end

  scope :EconomCarriage, -> {where(type: 'Плацкарт')}
  scope :CoupeCarriage, -> {where(type: 'Купе')}
  scope :SedentaryCarriage, -> {where(type: 'Сидячий')}
  scope :SvCarriage, -> {where(type: 'СВ')}

  private

  def set_number
    self.number = (train.carriages.maximum('number') || 0).next
  end

end
