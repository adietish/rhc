require 'ostruct'

module RHC
  module Rest
    class User < Base
      define_attr :login, :plan_id, :max_gears, :consumed_gears

      def add_key(name, content, type)
        debug "Add key #{name} of type #{type} for user #{login}"
        rest_method "ADD_KEY", :name => name, :type => type, :content => content
      end

      def keys
        debug "Getting all keys for user #{login}"
        rest_method "LIST_KEYS"
      end

      #Find Key by name
      def find_key(name)
        #TODO do a regex caomparison
        keys.detect { |key| key.name == name }
      end

      def capabilities
        @capabilities ||= OpenStruct.new attribute('capabilities')
      end
    end
  end
end
