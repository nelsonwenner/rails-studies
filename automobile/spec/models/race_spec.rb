require 'rails_helper'

RSpec.describe Race, type: :model do
  describe 'Associations' do
    it { should belong_to(:tournament) }
    it { should have_many(:pilot_car_races).class_name('PilotCarRace') }
  end

  describe 'Validations' do
    it { should validate_presence_of(:date).on(:create) }
  end
end
