class Race < ApplicationRecord
  validates_presence_of :date, :total_laps, :total_time, :best_lap, 
                        :time_best_lap, :starting_grid, :average_velocity, on: :create
end
