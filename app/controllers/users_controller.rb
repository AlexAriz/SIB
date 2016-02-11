# The controller for showing and deleting
# the users registered in the system.
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!
  load_and_authorize_resource
  before_filter :check_for_database

  def index
    @users = User.all
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_show_path(@user), notice: msg_update }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    if current_user.id == @user.id
      redirect_to :index, notice: 'No se pudo eliminar el usuario,
                                  ya que es usted mismo'
    else
      @user.destroy
      redirect_to users_index_url, notice: 'Se ha eliminado exitosamente el
                                            usuario'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    if params[:admin].present?
      params.require(:admin).permit(:email,
                                    :user_name,
                                    :image_profile,
                                    person_attributes: [:id,
                                                        :name,
                                                        :last_name,
                                                        :university,
                                                        :area_of_interest,
                                                        :comments,
                                                        :first_choice,
                                                        :_destroy])
    elsif params[:tutor].present?
      params.require(:tutor).permit(:email,
                                    :user_name,
                                    :image_profile,
                                    person_attributes: [:id,
                                                        :name,
                                                        :last_name,
                                                        :university,
                                                        :area_of_interest,
                                                        :comments,
                                                        :first_choice,
                                                        :_destroy])
    else
      params[:candidate].present?
      params.require(:candidate).permit(:email,
                                        :user_name,
                                        :image_profile,
                                        person_attributes: [:id,
                                                            :name,
                                                            :last_name,
                                                            :university,
                                                            :area_of_interest,
                                                            :comments,
                                                            :first_choice,
                                                            :_destroy])
    end
  end

  def check_for_database
    ActiveRecord::Base.connection_pool.with_connection(&:active?)
  rescue
    flash[:error] = 'Ha sucedido un error inesperado'
    redirect_to controller: :static_pages
  end

  def msg_update
    'Haz editado tu perfil de manera exitosa'
  end
end
