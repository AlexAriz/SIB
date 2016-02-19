# A class to manage the tutor's e-mail
class TutorMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def cancellation_tutoring(user, tutor)
    @user_candidate = user
    @user_tutor = tutor
    mail(to: @user_candidate.email, subject: 'Cancelación de tutoría')
  end
end
