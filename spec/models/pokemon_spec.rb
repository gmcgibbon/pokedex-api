require 'rails_helper'

RSpec.describe Pokemon, type: :model do

  subject { create :pokemon }

  context 'validations' do

    it { should validate_presence_of :name }
  end

  context 'image uploader' do

    subject { build(:pokemon).image }

    it { is_expected.to be_a Pokemon::ImageUploader }
  end

  describe '.from_api' do

    let(:api_pokemon) { PokeAPI::Pokemon.find :mock }

    subject { described_class.from_api api_pokemon }

    it { is_expected.to be_valid }
    it { is_expected.to be_new_record }
    it { is_expected.to have_attributes(name: 'Mock') }
    it 'should have image' do
      expect(subject.image_url).to be_present
    end
  end

  describe '.sample' do

    let!(:pokemons) { create_list :pokemon, 10 }

    context 'without size' do

      let(:random) { pokemons.sample }
      subject      { described_class.sample }

      it { is_expected.to be_a described_class }

      it 'should exist in database' do
        expect(subject).to be_in pokemons
      end
    end

    context 'with size' do

      let(:size)   { Array(1..9).sample }
      let(:random) { pokemons.sample size  }
      subject      { described_class.sample size }

      it { is_expected.to be_an ActiveRecord::Relation }

      it 'should not contain duplicates' do
        expect(subject.distinct.size).to eq subject.size
      end

      it 'should all exist in database' do
        subject.each { |element| expect(element).to be_in pokemons }
      end
    end
  end

end
