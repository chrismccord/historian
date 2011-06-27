module Historian
  
  class Error < StandardError
    attr_reader :data

    def initialize(data)
      @data = data
      super
    end
  end
  
  class CategoryNotFound < Error; end
end