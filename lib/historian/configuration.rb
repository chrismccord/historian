module Historian
  module Configuration

    DEFAULT_LAYOUT = nil
    DEFAULT_BEFORE_FILTERS = []
    DEFAULT_RECORDS_PER_PAGE = 60
    attr_accessor :layout, :before_filters, :records_per_page
    
    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end
    
    def configure
      yield self
    end
    
    def reset
      self.layout            = DEFAULT_LAYOUT
      self.before_filters    = DEFAULT_BEFORE_FILTERS
      self.records_per_page  = DEFAULT_RECORDS_PER_PAGE
      
    end
  end
end