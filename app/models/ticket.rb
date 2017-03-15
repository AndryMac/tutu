class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :start_station, class_name: "RailwayStation", foreign_key: :start_station_id
  belongs_to :end_station, class_name: "RailwayStation", foreign_key: :end_station_id

  before_validation :set_user

  private

  def set_user
    user = User.where(name: passenger_name).first

    if @user
      self.user = user
    else
      self.user = User.create(name: passenger_name)
    end
  end
end
