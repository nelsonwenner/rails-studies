class Profile < ApplicationRecord
  has_one :address, dependent: :destroy
  has_many :post, dependent: :destroy
  
  

  has_many :requester_invitations, class_name: 'Invitation', foreign_key: 'requester_id'
  has_many :frienships_invitations, class_name: 'Invitation', foreign_key: 'guest_id'
  
  accepts_nested_attributes_for :address
  
  validates_presence_of :name, :email, on: :create
end
