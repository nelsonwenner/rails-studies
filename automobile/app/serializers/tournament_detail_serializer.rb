class TournamentDetailSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :tournament, :races, :pilots, :cars, :tournament_races_url

  def tournament
    object.year
  end

  def races
    object.races.count
  end

  def pilots
    object.pilots.count
  end

  def cars
    object.cars.count
  end

  def tournament_races_url
    api_v1_tournament_races_path(object.year)
  end
end
