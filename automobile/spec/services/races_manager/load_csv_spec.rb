require 'rails_helper'

RSpec.describe RacesManager::LoadCsv do
  let(:csv) { Rack::Test::UploadedFile.new(Rails.root.join(
  'spec', 'fixtures', 'files', 'race_2019_01_31.csv')) }
  subject { RacesManager::LoadCsv.new(csv) }

  describe "#call" do
    it "Should be able to load CSV, reading and create models" do
      expect { 
        subject.call
      }.to change(Tournament, :count).by(1)
      .and change(Race, :count).by(1)
      .and change(Pilot, :count).by(14)
      .and change(Car, :count).by(14)
      .and change(PilotCarRace, :count).by(14)
      .and change(Classification, :count).by(14)
    end
  end

  describe "#validate_name_file_and_extract_date" do
    it "Should be able to validate name file and extract date" do
      expect(
        subject.validate_name_file_and_extract_date("race_2019_01_31.csv")
      ).to eq({date: "2019/01/31", year: "2019"})
    end

    it "Should be able to validate name file invalid" do
      expect(
        subject.validate_name_file_and_extract_date("race_name_invalid_50_31.csv")
      ).to eq("File name invalid. Ex: race_<year>_<month>_<day>.csv")
    end
  end

  describe "#is_valid_date" do
    it "Should be able to validate a date valid" do
      expect(subject.is_valid_date("2019/01/31")).to eq("2019-01-31T00:00:00+00:00")
    end

    it "Should be able to validate a date invalid" do
      expect(subject.is_valid_date("2019/50/31")).to eq("Date invalid")
    end
  end
end
