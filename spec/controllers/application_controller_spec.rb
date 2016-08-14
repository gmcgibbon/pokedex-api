require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe '#redirect' do

    let(:pokemon) { create :pokemon }

    before do
      expect(Pokemon).to receive(:sample).and_return(pokemon)
      get :redirect
    end

    it { should respond_with :redirect }

    it { should redirect_to pokemon_path(pokemon) }
  end
end
