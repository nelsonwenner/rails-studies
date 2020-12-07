class Coin < ApplicationRecord
  # this entity talks to the mining_type entity, and belongs to mining_type
  # belongs_to: only stays in the identity where you will have a foreign key
  belongs_to :mining_type
end
