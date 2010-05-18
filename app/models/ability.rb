class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :update, :destroy], User do |user_access|
      user && user_access.id == user.id
    end
    can [:create], User
  end

end
