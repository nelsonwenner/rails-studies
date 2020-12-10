class Profile < ApplicationRecord
  has_one :address, dependent: :destroy
  has_many :post, dependent: :destroy
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :post
  
  validates_presence_of :name, :email, on: :create
end
