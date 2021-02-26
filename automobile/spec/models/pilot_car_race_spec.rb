require 'rails_helper'

RSpec.describe PilotCarRace, type: :model do
  describe 'Associations' do
    it { should belong_to(:pilot) }
    it { should belong_to(:car) }
    it { should belong_to(:race) }
  end
end
