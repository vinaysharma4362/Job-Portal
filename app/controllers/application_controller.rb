# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    # check for the class of the object to determine what type it is
    if resource.class == User
      root_path
    elsif resource.class == Company
      companies_dashboards_index_path
    end
  end
end
