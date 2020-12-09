class Profile < ApplicationRecord
  validates_presence_of :name, :email, on: :create
end
