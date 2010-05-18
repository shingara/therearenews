class User
  include Mongoid::Document

  field :login, :type => String

  has_many_related :feeds

  validates_presence_of :login
  validates_uniqueness_of :login

  index :login, :unique => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :rememberable, :trackable

end
