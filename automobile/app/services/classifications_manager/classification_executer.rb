module ClassificationsManager
  class ClassificationExecuter < ApplicationService
    
    attr_reader :race

    POINTS = %w(12 10 8 6 4 2).freeze

    def initialize(race)
      @race = race
    end

    def call
      classifications_points = add_points(classification_format(@race.pilot_car_races.completed_race))
      classifications_with_best_lap = add_point_best_lap(classifications_points)
      classifications_with_poli_position = add_point_poli_position(classifications_with_best_lap)
      result = array_merge(classifications_with_poli_position, 
        classification_format(@race.pilot_car_races.not_completed_race))

      rescue Exception => err
        OpenStruct.new({success?: false, errors: err})
      else
        OpenStruct.new({success?: true, payload: result})
    end

    def classification_format(race)
      race.map do |item|
        { 
          position: 0, points: 0,
          automobile: item.car.number,
          name: item.pilot.name,
          **item.classification.attributes
        }.symbolize_keys
      end
    end

    def array_merge(array_one, array_two)
      last_position = array_one.max_by { |obj| obj[:position] }

      array_one_formated = array_one.map { |obj| 
        PilotCarRaceSerializer.new(obj) 
      }

      array_two_formated = array_two.map.with_index { |obj, index|
        PilotCarRaceSerializer.new({**obj,
          position: last_position[:position] + (index+1),
          points: 0
        })
      }

      array_one_formated + array_two_formated
    end

    def add_point_best_lap(classifications)
      best_lap = classifications.min_by { |obj|
        calc_time_best_lap(obj[:time_best_lap])
      }

      classifications[
        classifications.index(best_lap)
      ] = { 
        **best_lap,
        points: best_lap[:points] + 1,
        position: best_lap[:position]
      }
      
      return classifications
    end

    def add_point_poli_position(classifications)
      poli = classifications.min_by { |obj|
        obj[:starting_grid]
      }

      classifications[
        classifications.index(poli)
      ] = {
        **poli,
        points: poli[:points] + 1,
        position: poli[:position]
      }
      
      return classifications
    end

    def add_points(pilot_car_races)
      classifications_clone = pilot_car_races.map(&:clone)
      
      pilot_car_races.map.with_index do |hash, index|
        pilot = classifications_clone.min_by { |pilot|
          calc_time_best_lap(pilot[:total_time]) 
        }

        duplicates = classifications_clone.find_all { |obj| 
          obj[:total_time] == pilot[:total_time]
        }

        if duplicates.size > 1
          pilot_best_lap = duplicates.min_by { |pilot|
            calc_time_best_lap(pilot[:time_best_lap]) 
          }
          
          duplicate_pilot_best_lap = duplicates.find_all { |obj| 
            obj[:time_best_lap] == pilot_best_lap[:time_best_lap]
          }

          if duplicate_pilot_best_lap.size > 1
            pilot_average_velocity = duplicate_pilot_best_lap.max_by { |obj| 
              obj[:average_velocity].to_f
            }
            
            pilot = pilot_average_velocity
          else
            pilot = pilot_best_lap
          end
        end

        if index <= (POINTS.size - 1)
          current_pilot = classifications_clone.delete(pilot)
        
          { 
            **current_pilot,
            points: POINTS[index].to_i,
            position: index+1
          }
        else
          current_pilot = classifications_clone.delete(pilot)
          
          { 
            **current_pilot,
            points: 1,
            position: index+1
          }
        end
      end
    end

    def calc_time_best_lap(time)
      current_time = time.split(":")
      current_time.sum(&:to_f)
    end
  end
end
