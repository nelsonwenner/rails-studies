require 'rails_helper'

RSpec.describe Classification, type: :model do
  describe 'Associations' do
    it { should belong_to(:pilot_car_race) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:total_laps).on(:create) }
    it { should validate_presence_of(:total_time).on(:create) }
    it { should validate_presence_of(:best_lap).on(:create) }
    it { should validate_presence_of(:time_best_lap).on(:create) }
    it { should validate_presence_of(:starting_grid).on(:create) }
    it { should validate_presence_of(:average_velocity).on(:create) }
  end
end
