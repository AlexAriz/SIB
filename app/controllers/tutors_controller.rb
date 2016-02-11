# Controller for all the tutors.
class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show]
  load_and_authorize_resource

  def index
    @tutors = Tutor.all
  end

  def show
  end

  def request_as_tutor
    tutor = Tutor.find(params[:tutor_id])
    candidate = Candidate.find(params[:candidate_id])
    tutor.candidates << candidate
    redirect_to tutor_path(params[:tutor_id]),
                notice: 'Has solicitado al tutor exitosamente'
  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:id])
  end
end
