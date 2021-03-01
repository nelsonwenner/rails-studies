require 'rails_helper'

RSpec.describe Api::V1::RacesController, type: :controller do
  describe "POST #create" do
    let(:csv_valid_one) { Rack::Test::UploadedFile.new(Rails.root.join(
    'spec', 'fixtures', 'files', 'race_2019_01_31.csv')) }
    let(:csv_valid_two) { Rack::Test::UploadedFile.new(Rails.root.join(
    'spec', 'fixtures', 'files', 'race_2019_03_25.csv')) }
    let(:csv_valid_three) { Rack::Test::UploadedFile.new(Rails.root.join(
    'spec', 'fixtures', 'files', 'race_2019_05_01.csv')) }
    let(:csv_invalid_date) { Rack::Test::UploadedFile.new(Rails.root.join(
    'spec', 'fixtures', 'files', 'race_2019_02_31.csv')) }
    let(:csv_invalid_format) { Rack::Test::UploadedFile.new(Rails.root.join(
    'spec', 'fixtures', 'files', 'race_name_invalid_01_02.csv')) }
    let(:csv_invalid_quantity) { Rack::Test::UploadedFile.new(Rails.root.join(
    'spec', 'fixtures', 'files', 'race_2019_04_01.csv')) }

    it 'Should be able to process CSV and return status successfully' do
      expect { 
        response = post :create, params: { race_file: csv_valid_one }
      }.to change(Tournament, :count).by(1)
      .and change(Race, :count).by(1)
      .and change(Pilot, :count).by(14)
      .and change(Car, :count).by(14)
      .and change(PilotCarRace, :count).by(14)
      .and change(Classification, :count).by(14)

      expect(eval(response.body)[:message]).to eq("successfully")
      expect(response.status).to equal(200)
    end

    it 'Should be able to process CSV and create more a race in the tournament.' do
      expect { 
        post :create, params: { race_file: csv_valid_one }
        post :create, params: { race_file: csv_valid_two }
      }.to change(Race, :count).by(2)
    end

    it 'Should not be able to process CSV, only 14 pilots/cars are allowed per race' do
      response = post :create, params: { race_file: csv_invalid_quantity }
      expect(eval(response.body)[:errors]).to eq("Only 14 pilots/cars are allowed per race.")
      expect(response.status).to equal(422)
    end

    it 'Should not be able to process CSV, a car can have different drivers in different races, and versa' do
      post :create, params: { race_file: csv_valid_two }
      post :create, params: { race_file: csv_valid_three }
      
      pilots_cars_race = PilotCarRace.all

      expect([
        pilots_cars_race[0].race.date,
        pilots_cars_race[0].pilot.name,
        pilots_cars_race[0].car.number
      ]).to contain_exactly("2019/03/25", "Ana", 1000)
      
      expect([
        pilots_cars_race[7].race.date,
        pilots_cars_race[7].pilot.name,
        pilots_cars_race[7].car.number
      ]).to contain_exactly("2019/05/01", "Ana", 1001)
    end

    it 'Should not be able to process CSV, date invalid' do
      response = post :create, params: { race_file: csv_invalid_date }
      expect(eval(response.body)[:errors]).to eq("Date invalid")
      expect(response.status).to equal(422)
    end

    it 'Should not be able to process CSV, file name invalid' do
      response = post :create, params: { race_file: csv_invalid_format }
      expect(eval(response.body)[:errors]).to eq(
      "File name invalid. Ex: race_<year>_<month>_<day>.csv")
      expect(response.status).to equal(422)
    end
  end
end
