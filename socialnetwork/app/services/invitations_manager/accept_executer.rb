module InvitationsManager
  class AcceptExecuter < ApplicationService
    attr_reader :invitation

    def initialize(invitation)
      @invitation = invitation
    end
    
    def call
      ActiveRecord::Base.transaction do
        add(@invitation.requester, @invitation.guest)
        add(@invitation.guest, @invitation.requester)
        @invitation.destroy()
      end
    end

    private
      
      def add(profile, friend)
        @friendship = Friendship.new(
          profile_id: profile.id, 
          friend_id: friend.id
        )
        @friendship.save()
      end
  
  end
end
