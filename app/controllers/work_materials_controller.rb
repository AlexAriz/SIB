# Controlador del Material de trabajo
class WorkMaterialsController < ApplicationController
  include UsersHelper
  before_action :set_work_material, only: [:show, :edit, :update, :destroy,
                                           :assign, :update_assign_work_material]
  # before_action :prepare_candidates, only: [:update_assign_work_material]
  load_and_authorize_resource

  # GET /work_materials
  # GET /work_materials.json
  def index
    if current_user_tutor?
      @work_materials = Tutor.find(current_user.id).work_materials
    elsif current_user_admin?
      @work_materials = WorkMaterial.all
    end
  end

  # GET /work_materials/1
  # GET /work_materials/1.json
  def show
  end

  def show_user_work_material
    # code here
  end

  # GET /work_materials/new
  def new
    @work_material = WorkMaterial.new
  end

  # GET /work_materials/1/edit
  def edit
  end

  def assign
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
        format.html { redirect_to @work_material, notice: msg_after_update }
      else
        format.html { render :edit }
      end
    end
  end

  def update_assign_work_material
    @candidates_associated = @work_material.candidates.to_a
    @work_material.update(work_material_params)

    #### Esto estaba en un before action, pero no lo respetaba ######
    @candidates_updated = Array.new
    params[:work_material][:candidate_ids].each do |candidate_id|
      unless candidate_id.empty?
        candidate_registered = UsersWorkMaterial.
            find_by_candidate_id(candidate_id)
        unless candidate_registered.nil?
          @candidates_updated << candidate_registered
        end
      end
    end
    ###################################################################

    @work_material.tutor_id = current_user.id
    send_email_notification
    redirect_to @work_material, notice: msg_after_update
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

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def work_material_params
    params.require(:work_material).permit(:name, :description,
                                          :attachment, candidate_ids: [])
  end

  def msg_after_create
    'Material de trabajo creado con éxito'
  end

  def msg_after_update
    'Material de trabajo actualizado con éxito'
  end

  def msg_after_delete
    'Material de trabajo eliminado con éxito'
  end

  # Before action for updating (update) and update_assign_work_material
  def prepare_candidates
    @candidates_updated = Array.new
    params[:work_material][:candidate_ids].each do |candidate_id|
      unless candidate_id.empty?
        candidate_registered = UsersWorkMaterial.
            find_by_candidate_id(candidate_id)
        unless candidate_registered.nil?
          @candidates_updated << candidate_registered
        end
      end
    end
  end

  # When the user choose this option from the index
  def send_email_notification
    unless @candidates_associated.empty?
      @candidates_updated.each do |new_candidate|
        @candidates_associated.each do |candidate_registered|
          if new_candidate.candidate.id == candidate_registered.id
            @candidates_updated.delete(new_candidate)
          end
        end
      end
    end

    @candidates_updated.each do |candidate|
      WorkMaterialMailer.assignation_work_material(candidate.candidate,
                                                   @work_material.tutor).
          deliver_now
    end
  end

  def msg_after_assign
    'Material de trabajo asignado con éxito'
  end
end
