class UsersWorkMaterialsController < ApplicationController
  before_action :set_users_work_material, only: [:show, :edit, :update, :destroy]

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
        format.html { redirect_to @users_work_material, notice: 'Users work material was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_work_material }
      else
        format.html { render :edit }
        format.json { render json: @users_work_material.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_work_material
      @users_work_material = UsersWorkMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_work_material_params
      params[:users_work_material]
    end
end
