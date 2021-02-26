class pilot_car_race < ApplicationRecord
  #after_initialize :init

  belongs_to :pilot
  belongs_to :car
  belongs_to :race

  private

  #def init
  #  if self.where(tournament_id: self.tournament_id).count >= 14
  #    self.errors.add("Only 14 drivers/cars are allowed per race.")
  #  end 
  #end
end
