require 'rails_helper'

RSpec.describe Tournament, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:year).on(:create) }
  end
end
