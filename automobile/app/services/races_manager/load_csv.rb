require 'csv'

module RacesManager
  class LoadCsv < ApplicationService
    attr_reader :csv

    def initialize(csv)
      @csv = csv
    end

    def call
        data = validate_name_file_and_extract_date(@csv.original_filename)
        is_valid_date(data[:date])

        tournament = Tournament.find_or_create_by!(year: data[:year])
        race = Race.find_or_create_by!(date: data[:date], 
          tournament_id: tournament.id
        )

        ActiveRecord::Base.transaction do
          CSV.foreach(@csv.path, headers: true) do |row|

            pilot = Pilot.find_or_create_by!(
              name: row[1], tournament_id: tournament.id
            ) unless row[1].nil?

            car = Car.find_or_create_by!(
              number: row[0], tournament_id: tournament.id
            ) unless row[0].nil?

            pilot_car_race = PilotCarRace.create!(
              race_id: race.id,
              pilot_id: pilot.id,
              car_id: car.id
            ) unless (pilot.nil? or car.nil?) 

            Classification.create!(
              total_laps: row[2],
              total_time: row[3],
              best_lap: row[4],
              time_best_lap: row[5],
              diff: row[6],
              gap: row[7],
              starting_grid: row[8],
              average_velocity: row[9],
              pilot_car_race_id: pilot_car_race.id
            ) unless pilot_car_race.nil?
          end
        end
      rescue Exception => err
        OpenStruct.new({success?: false, errors: err})
      else
        OpenStruct.new({success?: true})
    end

    def validate_name_file_and_extract_date(file)
      result = file.match(/race_(\d\d\d\d)_(\d\d)_(\d\d)/)
      {
        date: "#{result[1]}/#{result[2]}/#{result[3]}", 
        year: result[1]
      } rescue "File name invalid. Ex: race_<year>_<month>_<day>.csv"
    end

    def is_valid_date(date)
      DateTime.parse(date) rescue "Date invalid"
    end
  end
end
