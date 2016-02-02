# This is a customized controller for the devise registration.
# It helps to retrieve new attributes added by us
# For example "User name"
class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:user_name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :type)
  end

  def account_update_params
    params.require(:user).permit(:user_name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :current_password)
  end
end
