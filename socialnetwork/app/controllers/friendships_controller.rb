class FriendshipsController < ApplicationController

  def undo
    friendship_params
    
    @profile = Friendship.find_by(
      profile_id: params[:profile_id],
      friend_id: params[:friend_id]
    ) or not_found
    
    @friend = Friendship.find_by(
      profile_id: params[:friend_id],
      friend_id: params[:profile_id]
    ) or not_found

    FriendshipsManager::UndoExecuter.call(@profile, @friend)
  end

  def friendship_params
    params.permit(:profile_id, :friend_id)
  end
  
end
