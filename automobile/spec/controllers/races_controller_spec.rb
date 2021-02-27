require 'rails_helper'

RSpec.describe Api::V1::RacesController, type: :controller do
  describe "POST #create" do
    let(:csv_valid) { Rack::Test::UploadedFile.new(Rails.root.join(
    'spec', 'fixtures', 'files', 'race_2019_01_31.csv')) }
    let(:csv_invalid_date) { Rack::Test::UploadedFile.new(Rails.root.join(
    'spec', 'fixtures', 'files', 'race_2019_02_31.csv')) }
    let(:csv_invalid_format) { Rack::Test::UploadedFile.new(Rails.root.join(
    'spec', 'fixtures', 'files', 'race_name_invalid_01_02.csv')) }

    it 'Should be able to process CSV and return status successfully' do
      response = post :create, params: { race_file: csv_valid }
      expect(eval(response.body)[:message]).to eq("successfully")
      expect(response.status).to equal(200)
    end

    it 'Should not be able to process CSV date invalid' do
      response = post :create, params: { race_file: csv_invalid_date }
      expect(eval(response.body)[:errors]).to eq("Date invalid")
      expect(response.status).to equal(422)
    end

    it 'Should not be able to process CSV file name invalid' do
      response = post :create, params: { race_file: csv_invalid_format }
      expect(eval(response.body)[:errors]).to eq(
      "File name invalid. Ex: race_<year>_<month>_<day>.csv")
      expect(response.status).to equal(422)
    end
  end
end
