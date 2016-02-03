class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    if current_user.id == @user.id
      redirect_to :index, notice: 'No se pudo eliminar el usuario, ya que es usted mismo'
    else
      @user.destroy
      redirect_to users_index_url, notice: 'Se ha eliminado exitosamente el usuario'
    end
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
