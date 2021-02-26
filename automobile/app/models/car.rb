class Car < ApplicationRecord
  belongs_to :tournament

  validates_presence_of :number, on: :create
end
