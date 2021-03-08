class RaceSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :race, :cars, :pilots, :tournament_race_classification_url

  def race
    object.date
  end

  def cars
    object.pilot_car_races.count
  end

  def pilots
    object.pilot_car_races.count
  end

  def tournament_race_classification_url
    date_format = object.date.split("/")
    classification_api_v1_tournament_races_path(
      object.tournament.year, date_format[1], date_format[2]
    )
  end
end
