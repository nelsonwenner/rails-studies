class Pilot < ApplicationRecord
  belongs_to :tournament, class_name: 'Tournament'

  validates_presence_of :name, on: :create
end
