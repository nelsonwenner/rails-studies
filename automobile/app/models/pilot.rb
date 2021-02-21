class Pilot < ApplicationRecord
  validates_presence_of :name, on: :create
  validates_uniqueness_of :name
end
