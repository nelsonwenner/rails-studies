class PilotCarRace < ApplicationRecord
  after_initialize :verify_quantity_race_cars_pilots

  belongs_to :pilot, class_name: 'Pilot'
  belongs_to :car, class_name: 'Car'
  belongs_to :race, class_name: 'Race'

  has_one :classification, class_name: 'Classification'
 
  validates_uniqueness_of :race_id, :scope => [:pilot_id, :car_id], message: "There is already this pilot and car in this race. Constraint pair of unique value."

  private

  def verify_quantity_race_cars_pilots
    if PilotCarRace.where(race_id: self.race_id).count > 14
      raise Exception.new "Only 14 pilots/cars are allowed per race."
    end 
  end
end
