class Pilot < ApplicationRecord
  belongs_to :tournament

  validates_presence_of :name, on: :create
end
