class Feed
  include Mongoid::Document

  field :url, :type => String
  field :login_to_push, :type => String

  belongs_to_related :user

  before_save :subscribe_feed

  def subscribe_feed
    Therearenews::Application::SUBSCRIBE_CHANNEL.push(url)
  end
end
