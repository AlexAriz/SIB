# Este es el controlador para las Becas
class ScholarshipsController < ApplicationController
  before_action :set_scholarship, only: [:show, :edit, :update, :destroy]

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
      after_create(@scholarship.save, format)
    end
  end

  # PATCH/PUT /scholarships/1
  # PATCH/PUT /scholarships/1.json
  def update
    respond_to do |format|
      after_update(@scholarship.update(scholarship_params), format)
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

  def after_update(flag, format)
    if flag
      format.html { redirect_to @scholarship, notice: msg_after_update }
      format.json { render :show, status: :ok, location: @scholarship }
    else
      format.html { render :edit }
      format.json render json: @scholarship.errors,
                         status: :unprocessable_entity

    end
  end

  def after_create(flag, format)
    if flag
      format.html { redirect_to(action: :index, notice: msg_after_create) }
      format.json { render :show, status: :created, location: @scholarship }
    else
      format.html { render :new }
      format.json render json: @scholarship.errors,
                         status: :unprocessable_entity
    end
  end

  def msg_after_destroy
    'Scholarship was successfully destroyed.'
  end

  def msg_after_update
    'Scholarship was successfully updated.'
  end

  def msg_after_create
    'Scholarship was successfully created.'
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_scholarship
    @scholarship = Scholarship.find(params[:id])
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
