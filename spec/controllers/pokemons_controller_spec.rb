require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do

  describe '#show' do

    let(:pokemon) { create :pokemon }

    let(:json) do
      pokemon.as_json(only: %i(id name), methods: %i(image_url))
    end

    before { get :show, params: { id: pokemon.id } }

    it { should respond_with :success }

    it 'should render expected JSON' do
      expect(response.json).to eq json
    end
  end
end
