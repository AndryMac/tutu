class EconomCarriage < Carriage
  validates  :number_top_place, :number_bottom_place, :number_side_top_place, :number_side_bottom_place,  presence: true

  def econom?
    self
  end
end
