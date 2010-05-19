class UsersController < InheritedResources::Base
  load_and_authorize_resource

  def create
    create! do |format|
      format.html {
        sign_in @user
        redirect_to user_url(@user)
      }
    end
  end
end
