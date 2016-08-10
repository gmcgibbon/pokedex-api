class PokemonsController < ApplicationController

  before_action :build_pokemon, only: %i(create)
  before_action :load_pokemon,  only: %i(show update destroy)

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

  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @pokemon.destroy
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
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
