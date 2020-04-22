class CompanyAbility
  include CanCan::Ability

  def initialize(company)
    can :manage, JobPost, company_id: company.id
  end
end