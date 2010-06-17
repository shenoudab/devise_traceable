unless defined?(Devise)
  require 'devise'
end

Devise.add_module :traceable, :model => 'devise_traceable/model'

module DeviseTraceable
end

require 'devise_traceable/rails'