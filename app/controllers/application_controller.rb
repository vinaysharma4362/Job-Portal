# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  rescue_from ActionController::RoutingError, with: :error_404

  def current_ability
    @current_ability ||= if current_company
                           CompanyAbility.new(current_company)
                         elsif current_user
                           UserAbility.new(current_user)
                         else
                           UserAbility.new(current_user)
                         end
  end
end
