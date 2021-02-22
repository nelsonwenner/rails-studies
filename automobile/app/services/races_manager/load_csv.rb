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

        @tournament = nil

        ActiveRecord::Base.transaction do
          CSV.foreach(@csv.path, headers: true) do |row|
            @tournament = Tournament.create!(year: data[:year]) if @tournament.nil?

            @pilot = Pilot.create!(name: row[1])
            @car = Car.create!(number: row[0])
            Race.create!(
              date: data[:date],
              total_laps: row[2],
              total_time: row[3],
              best_lap: row[4],
              time_best_lap: row[5],
              diff: row[6],
              gap: row[7],
              starting_grid: row[8],
              average_velocity: row[9],
              pilot_id: @pilot.id,
              tournament_id: @tournament.id,
              car_id: @car.id
            )
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
