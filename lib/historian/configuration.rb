module Historian
  module Configuration

    DEFAULT_LAYOUT              = 'historian'
    DEFAULT_BEFORE_FILTERS      = []
    DEFAULT_RECORDS_PER_PAGE    = 60
    DEFAULT_AUTO_CREATE         = true
    DEFAULT_MAX_COLUMNS         = 10
    DEFAULT_TIMESTAMP_FORMAT    = '%m/%d/%Y'
    
    attr_accessor :layout,
                  :before_filters, 
                  :records_per_page,
                  :auto_create,
                  :max_columns,
                  :timestamp_format
    
    # set all configuration options to their default values
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
      self.auto_create       = DEFAULT_AUTO_CREATE
      self.max_columns       = DEFAULT_MAX_COLUMNS
      self.timestamp_format  = DEFAULT_TIMESTAMP_FORMAT
    end
  end
end