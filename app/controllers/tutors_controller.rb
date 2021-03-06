# Controller for all the tutors.
class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :candidates,
                                   :show_details_of_candidate,
                                   :cancel_tutoring]
  before_action :set_candidate, only: [:request_as_tutor,
                                       :show_details_of_candidate,
                                       :accept_candidate,
                                       :reject_candidate,
                                       :cancel_tutoring]
  after_action :send_mail_cancelling_tutoring, only: [:cancel_tutoring]
  load_and_authorize_resource

  def index
    @tutors = nil
    if params[:user_name] || params[:email]
      @tutors = Tutor.by_user_name(params[:user_name]).by_email(params[:email])
    end
  end

  def show
  end

  def candidates
    @candidates = @tutor.candidates.includes(:person)
  end

  def show_details_of_candidate
  end

  def accept_candidate
    candidate_name = @candidate.person.name
    @candidate.update_attribute(:pending, false)
    redirect_to candidates_of_tutor_path(@candidate.tutor), notice: "Haz
                                aceptado al candidato #{candidate_name}"
  end

  def reject_candidate
    tutor = @candidate.tutor
    candidate_name = @candidate.person.name
    @candidate.update_attribute(:tutor_id, nil)
    redirect_to candidates_of_tutor_path(tutor), notice: "Haz
                     rechazado al candidato #{candidate_name}"
  end

  def request_as_tutor
    tutor = Tutor.find(params[:tutor_id])
    @candidate.update_attribute(:requested_date, Time.now)
    tutor.candidates << @candidate
    redirect_to tutor_path(params[:tutor_id]),
                notice: 'Has solicitado al tutor exitosamente'
  end

  def cancel_tutoring
    tutor = @candidate.tutor
    candidate_name = @candidate.person.name
    @candidate.update_attributes(tutor_id: nil, pending: true)
    @candidate.work_materials.delete_all
    redirect_to candidates_of_tutor_path(tutor),
                notice: "Haz cancelado la tutoría del
                candidato #{candidate_name}" if current_user_tutor?
    redirect_to user_show_path(current_user.id),
                notice: "Haz cancelado tu tutoría" if current_user_candidate?
  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  def set_candidate
    @candidate = Candidate.find(params[:candidate_id])
  end

  def send_mail_cancelling_tutoring
    TutorMailer.cancellation_tutoring(@candidate, @tutor).deliver_now
  end
end
