class CoupeCarriage < Carriage
  validates  :number_top_place, :number_bottom_place,  presence: true
end
