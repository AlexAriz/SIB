# Controlador del Material de trabajo
class WorkMaterialsController < ApplicationController
  include UsersHelper
  before_action :set_work_material, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /work_materials
  # GET /work_materials.json
  def index
    if current_user_tutor?
      @work_materials = Tutor.find(current_user.id).work_materials
    elsif current_user_candidate?
      candidate_work_waterials = set_candidate_work_waterials
      @work_materials = candidate_work_waterials.first
      @users_work_materials = candidate_work_waterials.last
    else
      @work_materials = WorkMaterial.all
    end
  end

  # GET /work_materials/1
  # GET /work_materials/1.json
  def show
  end

  # GET /work_materials/new
  def new
    @work_material = WorkMaterial.new
  end

  # GET /work_materials/1/edit
  def edit
  end

  # POST /work_materials
  # POST /work_materials.json
  def create
    @work_material = WorkMaterial.new(work_material_params)
    @work_material.tutor_id = current_user.id

    respond_to do |format|
      if @work_material.save
        format.html { redirect_to @work_material, notice: msg_after_create }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /work_materials/1
  # PATCH/PUT /work_materials/1.json
  def update
    respond_to do |format|
      if @work_material.update(work_material_params)
        @work_material.tutor_id = current_user.id
        format.html { redirect_to @work_material, notice: msg_after_update }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /work_materials/1
  # DELETE /work_materials/1.json
  def destroy
    @work_material.destroy
    respond_to do |format|
      format.html { redirect_to work_materials_url, notice: msg_after_delete }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_work_material
    @work_material = WorkMaterial.find(params[:id])
  end

  def set_candidate_work_material
    if current_user_candidate?
      @users_work_material = UsersWorkMaterial.find(params[:user_work_material])
    end
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def work_material_params
    params.require(:work_material).permit(:name, :description,
                                          :attachment, candidate_ids: [])
  end

  def msg_after_create
    # 'Work material was successfully created.'
    'Material de trabajo creado con éxito'
  end

  def msg_after_update
    # 'Work material was successfully updated.'
    'Material de trabajo actualizado con éxito'
  end

  def msg_after_delete
    # 'Work material was successfully destroyed.'
    'Material de trabajo eliminado con éxito'
  end

  def set_candidate_work_waterials
    [
      Candidate.find(current_user.id).work_materials,
      Candidate.find(current_user.id).users_work_materials
    ]
  end
end
