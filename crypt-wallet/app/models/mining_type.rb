class MiningType < ApplicationRecord
  has_many :coins, class_name: 'Coin', foreign_key: 'mining_type_id'
end