# Controller for all the tutors.
class TutorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tutor, only: [:show]
  before_filter :check_for_database

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

  def check_for_database
    ActiveRecord::Base.connection_pool.with_connection(&:active?)
  rescue
    flash[:error] = 'Ha sucedido un error inesperado'
    redirect_to controller: :static_pages
  end
end
