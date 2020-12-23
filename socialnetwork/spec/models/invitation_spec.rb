require 'rails_helper'

RSpec.describe Invitation, :type => :model do
  describe 'Associations' do
    it { should belong_to(:requester) }
    it { should belong_to(:guest) }
  end
end
