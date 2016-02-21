# A class to manage the tutor's e-mail
class TutorMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def cancellation_tutoring(candidate, tutor)
    @candidate = candidate
    @tutor = tutor
    mail(to: @candidate.email, subject: 'Cancelación de tutoría')
  end
end
