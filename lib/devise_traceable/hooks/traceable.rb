# After each sign in, sign out.
# This is only triggered when the user is explicitly set (with set_user)
# and on authentication. Retrieving the user from session (:fetch) does
# not trigger it.

Warden::Manager.after_set_user :except => :fetch do |record, warden, options|
  puts record
  if record.respond_to?(:insert_login!) #&& warden.authenticated?(options[:scope])
    record.insert_login!(warden.request)
  end
end

Warden::Manager.before_logout do |record, warden, opts|
  puts record
  if record.respond_to?(:update_logout!)
    record.update_logout!(warden.request)
  end
end
