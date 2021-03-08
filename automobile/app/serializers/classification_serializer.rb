class ClassificationSerializer < ActiveModel::Serializer

  attributes :position, :points, :car, :name, :total_laps, :total_time, :best_lap,
             :time_best_lap, :diff, :gap, :starting_grid, :average_velocity

  def position
    object.position
  end

  def points
    object.points
  end

  def car
    object.pilot_car_race.car.number
  end

  def name
    object.pilot_car_race.pilot.name
  end
end
