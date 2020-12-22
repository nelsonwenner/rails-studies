module InvitationsManager
  class AcceptExecuter < ApplicationService
    attr_reader :invitation

    def initialize(invitation)
      @invitation = invitation
    end
    
    def call
      puts 'CALL!!'
    end
    
  end
end