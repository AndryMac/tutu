class Carriage < ApplicationRecord
  validates :number_top_place, :number_bottom_place,  presence: true
  validates :number, uniqueness: { scope: :train_id }
  belongs_to :train

  before_validation :set_number, on: :create

  TYPES = {
      econom: 'EconomCarriage',
      coupe: 'CoupeCarriage',
      sitting: 'SedentaryCarriage',
      sv: 'SvCarriage'
  }

  TYPES.each do |key, value|
    scope key.to_sym, -> { where(type: value) }
  end

  # scope :EconomCarriage, -> {where(type: 'Плацкарт')}
  # scope :CoupeCarriage, -> {where(type: 'Купе')}
  # scope :SedentaryCarriage, -> {where(type: 'Сидячий')}
  # scope :SvCarriage, -> {where(type: 'СВ')}

  scope :ordered, ->(order) { order(number: order ? 'asc' : 'desc') }

  private

  def set_number
    self.number = (train.carriages.maximum('number') || 0).next
  end

end
