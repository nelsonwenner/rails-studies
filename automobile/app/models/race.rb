class Race < ApplicationRecord
  belongs_to :tournament

  validates_presence_of :date, on: :create
end
