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
end
