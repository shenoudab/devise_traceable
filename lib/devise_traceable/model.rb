require 'devise_traceable/hooks/traceable'

module Devise
  module Models
    # Trace information about your user sign in. It tracks the following columns:

    # * resource_id
    # * sign_in_at
    # * sign_out_at
    # * time
    #

    module Traceable
      def insert_login!(request)
        new_current = Time.now
        self.sign_in_at  = new_current
        save(:validate => false)
      end

      def update_logout!(request)
        new_current = Time.now
        self.sign_out_at  = new_current
        time = self.sign_out_at - self.sign_in_at
        self.time = time
        save(:validate => false)
      end
    end
  end
end
