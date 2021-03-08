module ClassificationsManager
  class ClassificationExecuter < ApplicationService
    
    def initialize(race)
      @race = race
    end

    def call
      classifications = get_classifications(@race)

      check_race = check_races(classifications)

      add_point_best_lap(check_race[:completed_race])
      add_point_pole_position(check_race[:completed_race])
      add_point_first_place(check_race[:completed_race])

      #check_race[:completed_race].each do |hash|
      #  if hash["position"] != 1 && hash["points"] <= 1
          
      #  else
          
      #  end
      #end

      result = check_race[:completed_race] + check_race[:not_completed_race]

      rescue Exception => err
        OpenStruct.new({success?: false, errors: err})
      else
        OpenStruct.new({success?: true, payload: result})
    end

    private

    attr_reader :race

    def get_classifications(race)
      race.pilot_car_races.map do |item|
        { 
          **item.classification.attributes, car: item.car.number,
          name: item.pilot.name, position: 0, points: 0
        }
      end
    end

    def add_point_first_place(classifications_array)
      array_items = classifications_array.find_all { |hash| hash[:points] >= 1 }

      if array_items.length == 2
        pilot_one = array_items[0]
        pilot_two = array_items[1] 

        if pilot_one[:time_best_lap] == pilot_two[:time_best_lap]
          # Average speed
          pilot = array_items.max_by { |hash| hash["average_velocity"] }
          classifications_array[classifications_array.index(pilot)][:position] = 1
          classifications_array[classifications_array.index(pilot)][:points] += 12
        else
          # Best lap time
          pilot = array_items.min_by { |hash| 
          calc_time_best_lap(hash["time_best_lap"]) }
          classifications_array[classifications_array.index(pilot)][:position] = 1
          classifications_array[classifications_array.index(pilot)][:points] += 12
        end
      else
        # first place
        classifications_array[classifications_array.index(array_items[0])][:position] = 1
        classifications_array[classifications_array.index(array_items[0])][:points] += 12
      end
    end

    def add_point_best_lap(classifications_array)
      best_lap = classifications_array.min_by { |hash| 
        calc_time_best_lap(hash["time_best_lap"])
      }
      classifications_array[classifications_array.index(
        best_lap
      )][:points] += 1 
    end

    def calc_time_best_lap(time)
      current_time = time.split(":")
      return current_time[0].to_i + current_time[1].to_f
    end

    def add_point_pole_position(classifications_array)
      pole_position = classifications_array.min_by { |hash| 
        hash["starting_grid"]
      }
      classifications_array[classifications_array.index(
        pole_position
      )][:points] += 1 
    end

    def check_races(classifications_array)
      new_classifications = {"completed_race": [], "not_completed_race": []}
      max_laps = classifications_array.max_by { |hash| 
        hash["total_laps"] 
      }["total_laps"]
      classifications_array.each { |hash|
        if hash["total_laps"] < max_laps 
          new_classifications[:not_completed_race] << hash
        else
          new_classifications[:completed_race] << hash
        end 
      }
      return new_classifications
    end
  end
end
