# Controller for the selection processes
# Views
class SelectionProcessesController < ApplicationController
  before_action :set_search_true, only:[:create, :update]
  before_action :set_selection_process, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /selection_processes
  # GET /selection_processes.json
  def index
    @selection_processes = nil
    if params[:university_name]
      @selection_processes = SelectionProcess.by_university_name(params[:university_name])
    end

    @selection_processes = SelectionProcess.all if session[:do_selecction_proce]
  end

  # GET /selection_processes/1
  # GET /selection_processes/1.json
  def show
    commontator_thread_show(@selection_process)
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
        format.html { redirect_to selection_processes_path, notice: msg_create }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /selection_processes/1
  # PATCH/PUT /selection_processes/1.json
  def update
    respond_to do |format|
      if @selection_process.update(selection_process_params)
        format.html { redirect_to @selection_process, notice: msg_update }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /selection_processes/1
  # DELETE /selection_processes/1.json
  def destroy
    @selection_process.destroy
    respond_to do |format|
      format.html { redirect_to selection_processes_url, notice: msg_destroy }
    end
  end

  private

  def msg_destroy
    'El proceso de selección se ha eliminado exitosamente'
  end

  def msg_update
    'El proceso de selección se ha modificado exitosamente'
  end

  def msg_create
    "Se ha creado exitosamente el proceso de selección para la universidad:
    #{@selection_process.university_name}"
  end

  def set_search_true
    session[:do_selection_processes] = true
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_selection_process
    @selection_process = SelectionProcess.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the
  # white list through.
  def selection_process_params
    params.require(:selection_process).permit(:university_name,
                                              :deadline, :activities, :link)
  end
end
