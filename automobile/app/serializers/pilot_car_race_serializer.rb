class PilotCarRaceSerializer < ActiveModel::Serializer
  attributes :position, :points, :automobile, :name, :total_laps, :total_time,
    :best_lap, :time_best_lap, :diff, :gap, :starting_grid, :average_velocity
  
  def position
    object[:position]
  end

  def points
    object[:points]
  end

  def automobile
    object[:automobile]
  end

  def name
    object[:name]
  end

  def total_laps
    object[:total_laps]
  end

  def total_time
    object[:total_time]
  end

  def best_lap
    object[:best_lap]
  end

  def time_best_lap
    object[:time_best_lap]
  end

  def diff
    object[:diff]
  end

  def gap
    object[:gap]
  end

  def starting_grid
    object[:starting_grid]
  end

  def average_velocity
    object[:average_velocity]
  end
end
