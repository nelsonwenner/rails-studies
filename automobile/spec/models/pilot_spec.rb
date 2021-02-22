require 'rails_helper'

RSpec.describe Pilot, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name).on(:create) }
    it { should validate_uniqueness_of(:name).with_message("Already exists a pilot with this name.")  }
  end
end
