require 'csv'

module RacesManager
  class LoadCsv < ApplicationService
    attr_reader :csv

    def initialize(csv)
      @csv = csv
    end

    def call
        date = validate_name_file_and_extract_date(@csv.original_filename)
        is_valid_date(date)
        
        CSV.foreach(@csv.path, headers: true) do |row|
          puts "\nCSV => #{ row }"
        end
      rescue Exception => err
        OpenStruct.new({success?: false, errors: err})
      else
        OpenStruct.new({success?: true, payload: 'test'})
    end

    def validate_name_file_and_extract_date(file)
      result = file.match(/race_(\d\d\d\d)_(\d\d)_(\d\d)/)
      "#{result[1]}/#{result[2]}/#{result[3]}" rescue "File name invalid. Ex: race_<year>_<month>_<day>.csv"
    end

    def is_valid_date(date)
      DateTime.parse(date) rescue "Date invalid"
    end
  end
end
