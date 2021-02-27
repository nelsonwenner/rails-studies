class PilotCarRace < ApplicationRecord
  #after_initialize :init

  belongs_to :pilot, class_name: 'Pilot'
  belongs_to :car, class_name: 'Car'
  belongs_to :race, class_name: 'Race'

  validates_uniqueness_of :race_id, :scope => [:pilot_id, :car_id], message: "There is already this pilot and car in this race. Constraint pair of unique value."

  private

  #def init
  #  if self.where(tournament_id: self.tournament_id).count >= 14
  #    self.errors.add("Only 14 drivers/cars are allowed per race.")
  #  end 
  #end
end
