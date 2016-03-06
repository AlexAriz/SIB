# Controller created only for setting up a root view.
# It can be deleted after all.
class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @users = User.all
  end
end
