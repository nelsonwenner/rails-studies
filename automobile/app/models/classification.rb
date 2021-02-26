class classification < ApplicationRecord
  belongs_to :pilot_car_race

  validates_presence_of :total_laps, :total_time, :best_lap, 
                        :time_best_lap, :starting_grid, :average_velocity, on: :create
end
