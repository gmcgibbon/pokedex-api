require 'rails_helper'

RSpec.describe User, type: :model do

  subject { create :user }

  context 'validations' do
    it { should validate_presence_of :email }
    context 'email format' do
      %w(user@local.host gannon@example.com a@email.addr).each do |str|
        it { should allow_value(str).for :email }
      end
      %w(user@local@host @ @test test@ a@@email.addr).each do |str|
        it { should_not allow_value(str).for :email }
      end
    end
  end

  context 'has_secure_password' do
    subject { build :user, password: nil }

    it { should validate_presence_of :password }
    it { should respond_to :authenticate }
    it { should respond_to :password= }
  end

  context 'knock authenticable resource' do

    describe '.from_token_payload' do

      context 'with valid sub' do
        let(:payload) { { sub: subject.id }.as_json }
        let(:user)    { described_class.from_token_payload payload }

        it 'should find user' do
          expect(user).to eq subject
        end
      end

      context 'with invlid sub' do
        let(:payload) { { sub: 0 }.as_json }
        let(:user)    { described_class.from_token_payload payload }

        it 'should raise error' do
          expect { user }.to raise_error ActiveRecord::RecordNotFound
        end
      end

    end

    describe '.from_token_request' do

      context 'with auth email' do
        let(:json)    { { auth: { email: subject.email } }.as_json }
        let(:request) { double(params: json) }
        let(:user)    { described_class.from_token_request request }

        it 'should find user' do
          expect(user).to eq subject
        end
      end

      context 'with auth' do
        let(:json)    { { auth: { id: subject.id } }.as_json }
        let(:request) { double(params: json) }
        let(:user)    { described_class.from_token_request request }

        it 'should be nil' do
          expect(user).to be_nil
        end
      end

      context 'with nothing' do
        let(:json)    { Hash.new.as_json }
        let(:request) { double(params: json) }
        let(:user)    { described_class.from_token_request request }

        it 'should be nil' do
          expect(user).to be_nil
        end
      end
    end

    describe '#to_token_payload' do
      let(:attributes) { %i(email first_name last_name) }
      let(:methods)    { %i(sub) }
      let(:json)       { subject.as_json(only: attributes, methods: methods) }
      let(:payload)    { subject.to_token_payload }

      it 'should be user hash' do
        expect(payload).to eq json.symbolize_keys
      end
    end
  end
end
