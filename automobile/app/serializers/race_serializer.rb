class RaceSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :race, :cars, :pilots

  def race
    object.date
  end

  def cars
    object.pilot_car_races.count
  end

  def pilots
    object.pilot_car_races.count
  end
end
