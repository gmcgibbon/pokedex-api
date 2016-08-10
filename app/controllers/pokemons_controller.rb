class PokemonsController < ApplicationController

  before_action :load_pokemon, only: %i(show)

  def show
    render json: @pokemon
  end

  private

  def load_pokemon
    @pokemon = Pokemon.find params[:id]
  end
end
