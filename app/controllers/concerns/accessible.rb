# frozen_string_literal: true

# For devise user sign out conflict
module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected

  def check_user
    if current_user&.has_role?(:admin)
      flash.clear
      redirect_to(admins_index_path) && return
    elsif current_company
      flash.clear
      redirect_to(companies_dashboards_index_path) && return
    end
  end
end
