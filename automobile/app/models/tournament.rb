class Tournament < ApplicationRecord
  validates_presence_of :year, on: :create
end
