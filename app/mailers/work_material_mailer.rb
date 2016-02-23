#A class to manage work material e-mail
class WorkMaterialMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def assignation_work_material(candidate, tutor)
    @candidate = candidate
    @tutor = tutor
    mail(to: @candidate.email, subject: 'Asignacion de material de trabajo')
  end
end
