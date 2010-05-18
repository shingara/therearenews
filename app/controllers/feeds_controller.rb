class FeedsController < InheritedResources::Base

  actions :new, :create, :edit, :update, :destroy

  load_and_authorize_resource

  def create
    @feed = Feed.new(params[:feed])
    @feed.user = current_user
    create! do |format|
      format.html { redirect_to user_url(current_user) }
    end
  end

end
