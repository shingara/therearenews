class Feed
  include Mongoid::Document

  field :url, :type => String
  field :login_to_push, :type => String

  belongs_to_related :user
end
