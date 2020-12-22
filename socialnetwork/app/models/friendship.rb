class Friendship < ApplicationRecord
  belongs_to :profile, class_name: 'Profile'
  belongs_to :friend, class_name: 'Profile'

  validates_uniqueness_of :profile_id, :scope => [:friend_id], message: 'Unique pair keys friendship exists'
end
