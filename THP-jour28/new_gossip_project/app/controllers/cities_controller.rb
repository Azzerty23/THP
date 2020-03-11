class CitiesController < ApplicationController
  
  def index
    @cities = City.all
  end

  def show
    @city = set_city
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_city
    @city = City.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def city_params
    params.require(:city).permit(:name)
  end

end