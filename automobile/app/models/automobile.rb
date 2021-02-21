class Automobile < ApplicationRecord
  validates_presence_of :number, on: :create
  validates_uniqueness_of :number
end
