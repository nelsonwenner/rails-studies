module InvitationsManager
  class RejectExecuter < ApplicationService
    attr_reader :invitation

    def initialize(invitation)
      @invitation = invitation
    end
    
    def call
      @invitation.destroy()
    end
    
  end
end
