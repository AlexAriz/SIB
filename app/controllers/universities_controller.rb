# Controlador de universidades
class UniversitiesController < ApplicationController
  before_action :set_university, only: [:show, :edit, :update, :destroy]
  before_action :set_search_true, only: [:create, :update]
  load_and_authorize_resource

  # GET /universities
  # GET /universities.json
  def index
    @universities = nil
    if params[:name] || params[:country]
      @universities = University.by_name(params[:name])
                                .by_country(params[:country])
    end

    @universities = University.all if session[:do_university_search]
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
        format.html { redirect_to universities_path, notice: msg_after_create }
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
        format.html { redirect_to universities_path, notice: msg_after_update }
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

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def university_params
    params.require(:university).permit(:name, :city, :state, :country,
                                       :information, :url)
  end

  def set_search_true
    session[:do_university_search] = true
  end
end
