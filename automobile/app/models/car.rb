class Car < ApplicationRecord
  belongs_to :tournament

  validates_presence_of :number, on: :create
  validates_uniqueness_of :number, message: "Already exists a car with this number."
end
