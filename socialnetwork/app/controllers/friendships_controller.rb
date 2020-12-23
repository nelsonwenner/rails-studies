class FriendshipsController < ApplicationController

  def undo
    friendship_params
    
    @profile = Friendship.where(
      profile_id: params[:profile_id],
      friend_id: params[:friend_id]
    ).first!
    
    @friend = Friendship.where(
      profile_id: params[:friend_id],
      friend_id: params[:profile_id]
    ).first!
    
    FriendshipsManager::UndoExecuter.call(@profile, @friend)
  end
  
  def friendship_params
    params.permit(:profile_id, :friend_id)
  end
  
end
