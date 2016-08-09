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
end
