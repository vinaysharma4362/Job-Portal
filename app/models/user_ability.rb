class UserAbility
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user.present?
      can :manage, Resume, user_id: user.id
      if user.has_role? :admin
        can :manage, :all
      end
    end
  end
end