class Tournament < ApplicationRecord
  has_many :races, dependent: :destroy
  has_many :pilots, dependent: :destroy
  has_many :cars, dependent: :destroy

  validates_presence_of :year, on: :create
end
