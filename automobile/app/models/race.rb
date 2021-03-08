class Race < ApplicationRecord
  has_many :pilot_car_races, class_name: 'PilotCarRace'
  belongs_to :tournament, class_name: 'Tournament'

  validates_presence_of :date, on: :create

end
