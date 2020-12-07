class MiningTypesController < ApplicationController
  before_action :set_mining_typem, only: [:show, :update, :destroy]
  
  def index
    @mining_types = MiningType.all()
    return render status: 200, json: @mining_types.as_json()
  end

  def show
    return render status: 200, json: @mining_type.as_json()
  end

  def create
    @mining_type = MiningType.new(mining_type_params)

    if @mining_type.save
      return render status: 201, json: @mining_type.as_json()
    else
      return render status: 400, json: @mining_type.errors.to_json
    end
  end

  def update
    if @mining_type.update(mining_type_params)
      return render status: 200, json: @mining_type.as_json()
    else
      return render status: 400, json: @mining_type.errors.to_json
    end
  end

  def destroy
    @mining_type.destroy()
  end
  
  private
    def set_mining_type
      @mining_type = MiningType.find(params[:id])
    end

    def mining_type_params
      params.require(:mining_type).permit(:name, :acronym)
    end
end

