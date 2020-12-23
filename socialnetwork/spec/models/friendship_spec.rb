require 'rails_helper'

RSpec.describe Friendship, :type => :model do
  describe 'Associations' do
    it { should belong_to(:profile) }
    it { should belong_to(:friend) }
  end
end
