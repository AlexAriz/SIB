class UsersWorkMaterialMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def update_progress(users_work_material)
    @users_work_material = users_work_material
    mail(to: @users_work_material.work_material.tutor.email,
         subject: 'Actualización de un material de trabajo')
  end
end
