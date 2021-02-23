require 'rails_helper'

RSpec.describe Api::V1::RacesController, type: :controller do
  describe "POST #create" do
    let(:csv) { Rack::Test::UploadedFile.new(Rails.root.join(
    'spec', 'fixtures', 'files', 'race_2019_01_31.csv')) }

    it 'Should be able to process CSV and return status successfully' do
      response = post :create, params: { race_file: csv }
      expect(eval(response.body)[:message]).to eq("successfully")
      expect(response.status).to equal(200)
    end
  end
end
