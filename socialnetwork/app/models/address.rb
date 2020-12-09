class Address < ApplicationRecord
  belongs_to :profile
  
  validates_presence_of :street, :suite, :city, :zipcode, on: :create
end
