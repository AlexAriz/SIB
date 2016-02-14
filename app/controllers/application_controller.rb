# This is the main controller. All controllers created by us, are a "child"
# of this controller.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :check_for_database

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def check_for_database
    ActiveRecord::Base.connection_pool.with_connection(&:active?)
  rescue
    flash[:error] = 'Ha sucedido un error inesperado'
    redirect_to controller: :static_pages
  end
end
