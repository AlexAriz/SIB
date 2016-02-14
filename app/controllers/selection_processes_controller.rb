class SelectionProcessesController < ApplicationController
  before_action :set_selection_process, only: [:show, :edit, :update, :destroy]
  before_action :confirm_permissions, only: [:edit, :update, :destroy, :new]
  before_action :authenticate_user!
  before_filter :check_for_database

  # GET /selection_processes
  # GET /selection_processes.json
  def index
    @selection_processes = SelectionProcess.all
  end

  # GET /selection_processes/1
  # GET /selection_processes/1.json
  def show
  end

  # GET /selection_processes/new
  def new
    @selection_process = SelectionProcess.new
  end

  # GET /selection_processes/1/edit
  def edit
  end

  # POST /selection_processes
  # POST /selection_processes.json
  def create
    @selection_process = SelectionProcess.new(selection_process_params)

    respond_to do |format|
      if @selection_process.save
        format.html { redirect_to @selection_process, notice: msg_after_create }
        # format.json { render :show, status: :created, location: @selection_process }
      else
        format.html { render :new }
        # format.json { render json: @selection_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selection_processes/1
  # PATCH/PUT /selection_processes/1.json
  def update
    respond_to do |format|
      if @selection_process.update(selection_process_params)
        format.html { redirect_to @selection_process, notice: msg_after_update }
        # format.json { render :show, status: :ok, location: @selection_process }
      else
        format.html { render :edit }
        # format.json { render json: @selection_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selection_processes/1
  # DELETE /selection_processes/1.json
  def destroy
    @selection_process.destroy
    respond_to do |format|
      format.html { redirect_to selection_processes_url, notice: msg_after_destroy }
      # format.json { head :no_content }
    end
  end

  private

  def msg_after_destroy
    'El proceso de selección se ha eliminado exitosamente'
  end

  def msg_after_update
    'El proceso de selección se ha modificado exitosamente'
  end

  def msg_after_create
    'Se ha creado exitosamente el proceso de selección para la universidad: ' + @selection_process.university_name
  end  
    # Use callbacks to share common setup or constraints between actions.
    def set_selection_process
      @selection_process = SelectionProcess.find(params[:id])
    end

  def check_for_database
    ActiveRecord::Base.connection_pool.with_connection(&:active?)
  rescue
    flash[:error] = 'Ha sucedido un error inesperado'
    redirect_to controller: :static_pages
  end

  def confirm_permissions
    unless can? :manage, @selection_process
      flash[:error] = 'No tienes los permisos para administrar los procesos de selección'
      redirect_to root_path
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selection_process_params
      params.require(:selection_process).permit(:university_name, :deadline, :activities, :link)
    end
end
