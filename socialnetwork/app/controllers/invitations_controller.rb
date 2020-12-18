class InvitationsController < ApplicationController

  def create
    @invitation = Invitation.new(invitation_params)
    
    if @invitation.save()
      return render status: 201, json: @invitation.as_json()
    else
      return render status: 400, json: @invitation.errors.to_json   
    end
  end
  
  private
    def invitation_params
      params.require(:invitation).permit(:requester_id, :guest_id)
    end

end