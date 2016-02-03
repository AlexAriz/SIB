# Controlador del Material de trabajo
class WorkMaterialsController < ApplicationController
  before_action :set_work_material, only: [:show, :edit, :update, :destroy]

  # GET /work_materials
  # GET /work_materials.json
  def index
    @work_materials = WorkMaterial.all
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
        format.json { render :show, status: :created, location: @work_material }
      else
        format.html { render :new }
        format.json { render json: @work_material.errors, status: :unprocessable_entity }
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
        format.json { render :show, status: :ok, location: @work_material }
      else
        format.html { render :edit }
        format.json { render json: @work_material.errors, status: :unprocessable_entity }
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

  # Never trust parameters from the scary internet, only allow the white list through.
  def work_material_params
    params.require(:work_material).permit(:name, :description, :file_src)
  end

  def msg_after_create
    'Work material was successfully created.'
  end

  def msg_after_update
    'Work material was successfully updated.'
  end

  def msg_after_delete
    'Work material was successfully destroyed.'
  end
end
