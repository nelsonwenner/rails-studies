require 'rails_helper'

RSpec.describe RacesManager::LoadCsv do
  let(:loadcsv) { RacesManager::LoadCsv.new("test") }

  describe "#validate_name_file_and_extract_date" do
    it "Should be able to validate name file and extract date" do
      expect(
        loadcsv.validate_name_file_and_extract_date("race_2019_01_31.csv")
      ).to eq({date: "2019/01/31", year: "2019"})
    end

    it "Should be able to validate name file invalid" do
      expect(
        loadcsv.validate_name_file_and_extract_date("race_name_invalid_50_31.csv")
      ).to eq("File name invalid. Ex: race_<year>_<month>_<day>.csv")
    end
  end

  describe "#is_valid_date" do
    it "Should be able to validate a date valid" do
      expect(loadcsv.is_valid_date("2019/01/31")).to eq("2019-01-31T00:00:00+00:00")
    end

    it "Should be able to validate a date invalid" do
      expect(loadcsv.is_valid_date("2019/50/31")).to eq("Date invalid")
    end
  end
end
