class Car < ApplicationRecord
  belongs_to :tournament, class_name: 'Tournament'

  validates_presence_of :number, on: :create
end
