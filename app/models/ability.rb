# Class used by can can can gem
# where you defined the permissions.
class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    # without the d -> of destroy:
    alias_action :create, :read, :update, to: :cru
    alias_action :read, :update, to: :read_and_update

    user ||= User.new # guest user (not logged in)
    if user.type == User::ADMIN
      can :manage, :all
    elsif user.type == User::TUTOR
      can :read_and_update, User
      can :cru, SelectionProcess
      can :read, University
      can :manage, Scholarship
      can :manage, WorkMaterial
      can :manage, Tutor
    else
      can :get_request, Scholarship
      can :read, :all
      can :update, Candidate
      can :get_request, Candidate
      can :request_as_tutor, Tutor
    end
  end
end
