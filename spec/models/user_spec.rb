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
end
