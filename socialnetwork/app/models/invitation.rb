class Invitation < ApplicationRecord
  belongs_to :requester, class_name: 'Profile'
  belongs_to :guest, class_name: 'Profile'
  
  validates_uniqueness_of :requester_id, :scope => [:guest_id], message: 'Unique pair keys invitation exists'
  
  def accept
    self.requester.friends.push(self.guest)
    self.guest.friends.push(self.requester)
  end

end
