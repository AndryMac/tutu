class SvCarriage < Carriage
  validates  :number_bottom_place,  presence: true

  def sv?
    self
  end
end
