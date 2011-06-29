module Historian
  module Configuration

    # Layout of categories controller
    DEFAULT_LAYOUT = 'historian'
    
    # Array of before filters to be applied to categories controller. Useful for authorization
    DEFAULT_BEFORE_FILTERS = []
    
    # Records to display per page
    DEFAULT_RECORDS_PER_PAGE = 60
    
    # Autocreate new category, inferring titles from hash keys, if given category does not exist, raise error if false
    DEFAULT_AUTO_CREATE = true
    
    # Max allowed metrics per category, limited to accommodate table width in layout without overflow
    DEFAULT_MAX_COLUMNS = 10
    
    # Format for Date/timestamp column in record table
    DEFAULT_TIMESTAMP_FORMAT = '%m/%d/%Y'
    
    # Mount point of the engine, controllers will be scoped to the mount point
    DEFAULT_MOUNT_POINT = 'historian'
    
    attr_accessor :layout,
                  :before_filters, 
                  :records_per_page,
                  :auto_create,
                  :max_columns,
                  :timestamp_format,
                  :mount_point
    
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
      self.mount_point       = DEFAULT_MOUNT_POINT
    end
  end
end