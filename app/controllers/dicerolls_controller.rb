class DicerollsController < ApplicationController
  before_action :set_diceroll, only: [:show]

  # GET /dicerolls/1
  # GET /dicerolls/1.json
  def show
  end

  # POST /dicerolls
  # POST /dicerolls.json
  def create
    @diceroll = Diceroll.new(parameters: dice_spec)

    if @diceroll.save
      render :show, status: :created, location: @diceroll
    else
      render json: @diceroll.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_diceroll
    @diceroll = Diceroll.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dice_spec
    params.require(:spec)
  end
end
