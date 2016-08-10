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

  describe '#create' do

    context 'valid params' do

      let(:params) do
        attributes_for(:pokemon, image: test_image_base64_string)
      end

      let(:json) do
        Pokemon.last.as_json(only: %i(id name), methods: %i(image_url))
      end

      before { post :create, params: { pokemon: params } }

      it { should respond_with :created }

      it 'should render expected JSON' do
        expect(response.json).to eq json
      end
    end

    context 'invalid params' do

      let(:params) do
        attributes_for(:pokemon, name: '')
      end

      let(:json) do
        { name: ["can't be blank"] }.with_indifferent_access
      end

      before { post :create, params: { pokemon: params } }

      it { should respond_with :unprocessable_entity }

      it 'should render expected JSON' do
        expect(response.json).to eq json
      end
    end
  end
end
