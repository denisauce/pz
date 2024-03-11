class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # гость

    if user.has_role? :trainer
      can :manage, Sport
    elsif user.has_role? :client
      can :read, Sport
    end
  end
end