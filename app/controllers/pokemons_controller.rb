class PokemonsController < ApplicationController

  before_action :build_pokemon, only: %i(create)
  before_action :load_pokemon,  only: %i(show)

  def create
    if @pokemon.save
      render json: @pokemon, status: :created
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @pokemon
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :image)
  end

  def build_pokemon
    @pokemon = Pokemon.new pokemon_params
  end

  def load_pokemon
    @pokemon = Pokemon.find params[:id]
  end
end
