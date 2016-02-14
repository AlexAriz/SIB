# Controlador de universidades
class UniversitiesController < ApplicationController
  before_action :set_university, only: [:show, :edit, :update, :destroy]
  before_action :confirm_permissions, only: [:edit, :update, :destroy, :new]
  before_action :authenticate_user!
  before_filter :check_for_database

  # GET /universities
  # GET /universities.json
  def index
    @universities = University.all
  end

  # GET /universities/1
  # GET /universities/1.json
  def show
  end

  # GET /universities/new
  def new
    @university = University.new
  end

  # GET /universities/1/edit
  def edit
  end

  # POST /universities
  # POST /universities.json
  def create
    @university = University.new(university_params)

    respond_to do |format|
      if @university.save
        format.html { redirect_to @university, notice: msg_after_create }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /universities/1
  # PATCH/PUT /universities/1.json
  def update
    respond_to do |format|
      if @university.update(university_params)
        format.html { redirect_to @university, notice: msg_after_update }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /universities/1
  # DELETE /universities/1.json
  def destroy
    @university.destroy
    respond_to do |format|
      format.html { redirect_to universities_url, notice: msg_after_destroy }
      format.json { head :no_content }
    end
  end

  private

  def msg_after_destroy
    'Se ha eliminado exitosamente'
  end

  def msg_after_update
    'Se ha modificado exitosamente'
  end

  def msg_after_create
    'Se ha creado exitosamente la universidad: ' + @university.name
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_university
    @university = University.find(params[:id])
  end

  def check_for_database
    ActiveRecord::Base.connection_pool.with_connection(&:active?)
  rescue
    flash[:error] = 'Ha sucedido un error inesperado'
    redirect_to controller: :static_pages
  end

  # Este metodo me sirve para validar si el usuario puede o no
  # gestionar las becas, en caso de que no pueda se le redirecciona
  # a la pagina principal con un mensaje de error.
  def confirm_permissions
    unless can? :manage, @scholarship
      flash[:error] = 'No puedes gestionar las universidades'
      redirect_to root_path
    end
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def university_params
    params.require(:university).permit(:name, :city, :state, :country,
                                       :information, :url)
  end
end
