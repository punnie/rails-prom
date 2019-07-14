class CointossesController < ApplicationController
  before_action :set_cointoss, only: [:show]

  # GET /cointosses/1
  # GET /cointosses/1.json
  def show
  end

  # POST /cointosses
  # POST /cointosses.json
  def create
    @cointoss = Cointoss.new(parameters: num_param)

    if @cointoss.save
      render :show, status: :created, location: @cointoss
    else
      render json: @cointoss.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cointoss
    @cointoss = Cointoss.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def num_param
    params.require(:num)
  end
end
