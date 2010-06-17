require 'devise_traceable/hooks/traceable'

module Devise
  module Models
    # Trace information about your user sign in. It tracks the following columns:

    # * resource_id
    # * sign_in_at
    # * sign_out_at
    
    module Traceable
      def stamp!
        new_current = Time.now
        "#{self.class}Tracing".constantize.create(:sign_in_at => self.current_sign_in_at, :sign_out_at => new_current, "#{self.class}".foreign_key.to_sym => self.id)
      end
    end
  end
end
