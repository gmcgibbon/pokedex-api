RSpec.configure do |config|
  config.include DataHelper

  class FactoryGirl::SyntaxRunner
    include DataHelper
  end
end
