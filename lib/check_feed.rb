require 'superfeedr-rb'
Superfeedr::Client.connect(AppConfig.superfeedr['login'], AppConfig.superfeedr['password'], :subscribe_channel => Therearenews::Application::SUBSCRIBE_CHANNEL) do |client|

  include ActionView::Helpers::TextHelper


  # Catch all notifications and check if url has notification and push it
  client.register_handler(:pubsub_event) do |evt|
    status = Superfeedr::Status.parse(evt)
    entries = Superfeedr::Entry.parse(evt)
    Feed.where(:url => status.feed).each do |feed|
      entries.each do |entry|
        message = <<-EOF
new entries :
href : #{entry.links.first.href}
title : #{entry.title}
extract : #{truncate(HTML::FullSanitizer.new.sanitize(entry.content), :length => 80)}
published : #{entry.published}
        EOF
        client.write Blather::Stanza::Message.new(feed.login_to_push, message)
      end
    end
  end

  # automatic reconnection
  client.register_handler(:disconnected) { client.connect }
end

