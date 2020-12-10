class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :destroy]

  def index
    @profiles = Profile.all()
    return render status: 200, json: @profiles.as_json(include: :address)
  end
  
  def create
    @profile = Profile.new(profile_params)
    
    if @profile.save()
      return render status: 201, json: @profile.as_json(include: :address)
    else
      return render status: 400, json: @profile.errors.to_json   
    end
  end
  
  private
    def set_profile
      @profile = Profile.find(params[:id])
    end
    
    def profile_params
      params.require(:profile).permit(:name, :email, address_attributes: [
        :street, :suite, :city, :zipcode
      ])
    end

end
