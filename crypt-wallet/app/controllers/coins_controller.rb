class CoinsController < ApplicationController
  # Call method set_coin before of methods show, update, destroy
  before_action :set_coin, only: [:show, :update, :destroy]

  def index
    @coins = Coin.all()
    return render status: 200, json: @coins.as_json(include: :mining_type)
  end

  def show
    return render status: 200, json: @coin.as_json()
  end

  def create
    @coin = Coin.new(coin_params)

    if @coin.save
      return render status: 201, json: @coin.as_json()
    else
      return render status: 400, json: @coin.errors.to_json
    end
  end

  def update
    if @coin.update(coin_params)
      return render status: 200, json: @coin.as_json()
    else
      return render status: 400, json: @coin.errors.to_json
    end
  end

  def destroy
    @coin.destroy()
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def coin_params
      params.require(:coin).permit(:description, :acronym, :url_image, :mining_type_id)
    end
end

