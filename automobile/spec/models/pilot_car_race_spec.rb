require 'rails_helper'

RSpec.describe PilotCarRace, type: :model do
  describe 'Associations' do
    it { should belong_to(:pilot).class_name('Pilot') }
    it { should belong_to(:car).class_name('Car') }
    it { should belong_to(:race).class_name('Race') }
  end

  describe 'Uniqueness' do
    subject { create(:pilot_car_race) }
    it { should validate_uniqueness_of(:race_id).scoped_to(:pilot_id, :car_id).with_message("There is already this pilot and car in this race. Constraint pair of unique value.") }
  end
end
