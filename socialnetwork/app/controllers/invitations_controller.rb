class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:accept, :reject]

  def create
    @invitation = Invitation.new(invitation_params)
    
    if @invitation.save()
      return render status: 201, json: @invitation.as_json()
    else
      return render status: 400, json: @invitation.errors.to_json   
    end
  end

  def accept
    InvitationsManager::AcceptExecuter.call(@invitation)
  end
  
  def reject
    InvitationsManager::RejectExecuter.call(@invitation)
  end
  
  private
    def set_invitation
      @invitation = Invitation.find(params[:id]) or not_found
    end

    def invitation_params
      params.require(:invitation).permit(:requester_id, :guest_id)
    end
end