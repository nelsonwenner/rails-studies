class Profile < ApplicationRecord
  has_one :address, class_name: "Address", foreign_key: "profile_id"
  
  validates_presence_of :name, :email, on: :create
end
