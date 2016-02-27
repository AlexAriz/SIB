# Controlador para la relacion entre candidatos y materiales de trabajo
class UsersWorkMaterialsController < ApplicationController
  before_action :set_users_work_material, only: [:show, :edit, :update]
  after_action :set_done_status, only: [:update]

  # GET /users_work_materials
  # GET /users_work_materials.json
  def index
    @users_work_materials = Candidate.find(current_user.id).users_work_materials
  end

  # GET /users_work_materials/1
  # GET /users_work_materials/1.json
  def show
  end

  # GET /users_work_materials/1/edit
  def edit
  end

  # PATCH/PUT /users_work_materials/1
  # PATCH/PUT /users_work_materials/1.json
  def update
    respond_to do |format|
      if @users_work_material.update(users_work_material_params)
        UsersWorkMaterialMailer.update_mail(@users_work_material).deliver_now
        format.html { redirect_to @users_work_material, notice: msg_update }
      else
        format.html { render :edit }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_users_work_material
    @users_work_material = UsersWorkMaterial.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def users_work_material_params
    params.require(:users_work_material).permit(:progress, :comment)
  end

  def set_done_status
    @users_work_material = UsersWorkMaterial.find(params[:id])
    @users_work_material.done = (@users_work_material.progress == 100)
    @users_work_material.save
  end

  def msg_update
    # 'Users work material was successfully updated.'
    'Progreso actualizado con éxito'
  end
end
