# Helper for the users controller.
module UsersHelper

  def is_current_user_admin?
    current_user.type=='Admin'
  end

  def is_current_user_candidate?
    current_user.type=='Candidate'
  end

  def is_current_user_tutor?
    current_user.type=='Tutor'
  end


end
