require 'rails_helper'

RSpec.describe RacesManager::LoadCsv do
  let(:loadcsv) { RacesManager::LoadCsv.new("test") }

  describe "#format_date" do
    it "Should be able to format the date" do
      expect(loadcsv.format_date("race_2019_01_31.csv")).to eq("2019/01/31")
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
