module Sampleable
  extend ActiveSupport::Concern

  class_methods do
    def sample(size=nil)
      results = limit(size || 1).order('RANDOM()')
      if size.nil? then results.first else results end
    end
  end
end
