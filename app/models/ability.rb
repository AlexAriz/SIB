# Class used by can can can gem
# where you defined the permissions.
class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    # without the d -> of destroy:
    alias_action :create, :read, :update, to: :cru

    user ||= User.new # guest user (not logged in)
    if user.type == User::ADMIN
      can :manage, :all
    elsif user.type == User::TUTOR
      can :cru, SelectionProcess
      can :manage, Scholarship
      can :manage, University
      can :manage, WorkMaterial
    else
      can :read, :all
      can :update, Candidate
      can :request_as_tutor, Tutor
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
