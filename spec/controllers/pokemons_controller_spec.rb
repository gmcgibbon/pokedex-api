require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do

  let(:user) { create :user }

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

    context 'as user' do
      it { should respond_with :success }
    end
  end

  describe '#create' do

    context 'as user' do

      before { token_authenticate user }

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

  describe '#update' do

    let(:pokemon) { create :pokemon }

    context 'as user' do

      before { token_authenticate user }

      context 'valid params' do

        let(:params) do
          attributes_for(:pokemon, name: 'changed')
        end

        let(:json) do
          pokemon.reload.as_json(only: %i(id name), methods: %i(image_url))
        end

        before { put :update, params: { id: pokemon.id, pokemon: params } }

        it { should respond_with :success }

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

        before { put :update, params: { id: pokemon.id, pokemon: params } }

        it { should respond_with :unprocessable_entity }

        it 'should render expected JSON' do
          expect(response.json).to eq json
        end
      end
    end
  end

  describe '#destroy' do

    let(:pokemon) { create :pokemon }

    context 'as user' do

      before { token_authenticate user }

      let(:json) do
        pokemon.as_json(only: %i(id name), methods: %i(image_url))
      end

      before { delete :destroy, params: { id: pokemon.id } }

      it { should respond_with :success }

      it 'should render expected JSON' do
        expect(response.json).to eq json
      end
    end
  end

end
