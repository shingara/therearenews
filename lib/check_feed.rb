require 'superfeedr-rb'
Superfeedr::Client.connect(AppConfig.superfeedr['login'], AppConfig.superfeedr['password']) do |client|
  # Catch all notifications
  # This works because Superfeedr::Client is just a subsclass of Blather::Client
  client.register_handler(:pubsub_event) do |evt|
    entries = Superfeedr::Entry.parse(evt)
    status = Superfeedr::Status.parse(evt)
  end
end

