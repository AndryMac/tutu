class SedentaryCarriage < Carriage
  validates  :number_seat_place,  presence: true

  def sedentary?
    self
  end
end
