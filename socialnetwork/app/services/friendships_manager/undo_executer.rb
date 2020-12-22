module FriendshipsManager
  class UndoExecuter < ApplicationService
    attr_reader :profile, :friend
    
    def initialize(profile, friend)
      @profile = profile
      @friend = friend
    end
    
    def call
      ActiveRecord::Base.transaction do
        @profile.destroy()
        @friend.destroy()
      end
    end
    
  end
end
