# Este es el controlador para las Becas
class ScholarshipsController < ApplicationController
  before_action :set_scholarship, only: [:show, :edit, :update, :destroy]
  before_action :confirm_permissions, only: [:edit, :update, :destroy, :new]
  before_action :authenticate_user!
  before_filter :check_for_database

  # GET /scholarships
  # GET /scholarships.json
  def index
    @scholarships = Scholarship.all
  end

  # GET /scholarships/1
  # GET /scholarships/1.json
  def show
  end

  # GET /scholarships/new
  def new
    @scholarship = Scholarship.new
  end

  # GET /scholarships/1/edit
  def edit
  end

  # POST /scholarships
  # POST /scholarships.json
  def create
    @scholarship = Scholarship.new(scholarship_params)

    respond_to do |format|
      if @scholarship.save
        format.html { redirect_to scholarships_path, notice: msg_after_create }
        # format.json { render :show, status: :created, location: @scholarship }
      else
        format.html { render :new }
        # format.json { render json: @scholarship.errors,
        # status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /scholarships/1
  # PATCH/PUT /scholarships/1.json
  def update
    respond_to do |format|
      if @scholarship.update(scholarship_params)
        format.html { redirect_to @scholarship, notice: msg_after_update }
        # format.json { render :show, status: :ok, location: @scholarship }
      else
        format.html { render :edit }
        # format.json { render json: @scholarship.errors,
        # status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scholarships/1
  # DELETE /scholarships/1.json
  def destroy
    @scholarship.destroy
    respond_to do |format|
      format.html { redirect_to scholarships_url, notice: msg_after_destroy }
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
    'Se ha creado exitosamente la beca: ' + @scholarship.name
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_scholarship
    @scholarship = Scholarship.find(params[:id])
  end

  def check_for_database
    ActiveRecord::Base.connection_pool.with_connection(&:active?)
  rescue
    flash[:error] = 'Ha sucedido un error inesperado'
    redirect_to controller: :static_pages
  end

  # Este método me sirve para validar si el usuario puede o no
  # gestionar las becas, en caso de que no pueda se le redirecciona
  # a la página principal con un mensaje de error.
  def confirm_permissions
    if !(can? :manage, @scholarship)
      flash[:error] = 'No puedes gestionar becas'
      redirect_to root_path
    end
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def scholarship_params
    params.require(:scholarship).permit(:name,
                                        :university_id,
                                        :start_date,
                                        :end_date,
                                        :description,
                                        :requirements,
                                        :benefits_offered,
                                        :url)
  end
end
