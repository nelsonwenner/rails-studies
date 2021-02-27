class Race < ApplicationRecord
  belongs_to :tournament, class_name: 'Tournament'

  validates_presence_of :date, on: :create
end
