require 'rails_helper'

RSpec.describe Pilot, type: :model do
  describe 'Associations' do
    it { should belong_to(:tournament) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name).on(:create) }
  end
end
