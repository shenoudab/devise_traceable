unless defined?(Devise)
  require 'devise'
end

module DeviseTraceable
  require 'devise_traceable/rails'
end

Devise.add_module :traceable, :model => 'devise_traceable/model'

