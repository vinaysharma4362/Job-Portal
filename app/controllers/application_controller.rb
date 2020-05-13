# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_user_location!, if: :storable_location?
  # before_action :set_last_seen_at, if: :user_signed_in?
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

  # protected

  # def set_last_seen_at
  #   current_user.touch(:last_seen_at)
  # end

  private

  def storable_location?
    request.get? && is_navigational_format? &&
      !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end
end
