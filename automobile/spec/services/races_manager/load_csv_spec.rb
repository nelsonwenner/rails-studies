require 'rails_helper'

RSpec.describe RacesManager::LoadCsv do
  describe "#format_date" do
    let(:loadcsv) { RacesManager::LoadCsv.new("test") }

    it "Should be able to format the date" do
      expect(loadcsv.format_date("race_2019_01_31.csv")).to eq("2019/01/31")
    end
  end
end
