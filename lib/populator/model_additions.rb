module Populator
  module ModelAdditions
    # Call populate on any ActiveRecord model to fill it with data.
    # Pass the an array of record hashes you want to create.
    # The method will take care of the ID and timestamps for you.
    #
    # Populator::Factory is where all the work happens.
    def populate(records, options = {}, &block)
      factory = Factory.for_model(self)
      factory.populate(records, options, &block)
      factory.save_records
    end
  end
end

ActiveRecord::Base.class_eval do
  extend Populator::ModelAdditions
end
