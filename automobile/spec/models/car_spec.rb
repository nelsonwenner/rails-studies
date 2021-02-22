require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:number).on(:create) }
    it { should validate_uniqueness_of(:number).with_message("Already exists a car with this number.")  }
  end
end
