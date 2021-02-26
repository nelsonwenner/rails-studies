class Pilot < ApplicationRecord
  belongs_to :tournament

  validates_presence_of :name, on: :create
  validates_uniqueness_of :name, message: "Already exists a pilot with this name."
end
