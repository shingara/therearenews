class Feed
  include Mongoid::Document

  field :url, :type => String
  field :login_to_push, :type => String

  belongs_to_related :user

  before_save :subscribe_feed

  def subscribe_feed
    s = UNIXSocket.new(AppConfig.superfeedr['socket'])
    s.write "subscribe:#{url}"
    s.close
  end
end
